import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/screens/Medical/Onboarding/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../CustomMethods/Validation_Methods.dart';
import '../../../user_controls/user_controls.dart';

class MedicalLogin extends StatefulWidget {
  const MedicalLogin({super.key});

  @override
  State<MedicalLogin> createState() => _MedicalLoginState();
}

class _MedicalLoginState extends State<MedicalLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool formValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/MedX logo.png",
                height: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Medical",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: CustomEmailField(
                  fieldText: "Email",
                  hintText: "Enter email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: email,
                  preText: "Please enter your email",
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: CustomFieldWithPretext(
                  fieldText: "Password",
                  obscureText: true,
                  hintText: "Enter password",
                  textEditingController: password,
                  preText: "Please enter your password",
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: Text("Forgot Password")),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: NextButton(
                  formValid: formValid,
                  onTap: () {
                    if (formValid) signIn();
                  },
                  text: "Log In",
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateForm() {
    if (!(ValidationMethods.isEmailValid(email.text))) return false;
    if (password.text.isEmpty) return false;
    return true;
  }

  void signIn() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String userId = userCredential.user!.uid;

      // Retrieve user details from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(userId)
          .get();
      if (!snapshot.exists) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isMedicalLogin", false);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Account not found. Please create an account."),
        ));
        return;
      }
      // Check if user details completion status is true or false
      bool detailsCompleted =
          (snapshot.data() as Map<String, dynamic>?)?['detailsCompleted'] ??
              false;
      await prefs.setBool('isMedicalLogin', true);
      Navigator.pop(context);
      print(detailsCompleted);
      if (detailsCompleted) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isMedicalLogin", true);
        Navigator.pushNamedAndRemoveUntil(
            context, "medical/main", (route) => false);
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetStarted(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Message"),
              content: Text(e.code),
              actions: [
                ActionChip(
                  label: const Text("Okay"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text("Message"),
              content: Text(e.code),
              actions: [
                ActionChip(
                  label: const Text("Okay"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }
}
