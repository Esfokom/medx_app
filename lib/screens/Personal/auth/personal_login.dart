import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/CustomMethods/Validation_Methods.dart';
import 'package:medx/screens/Personal/Onboarding/get_started.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalLogin extends StatefulWidget {
  const PersonalLogin({super.key});

  @override
  State<PersonalLogin> createState() => _PersonalLoginState();
}

class _PersonalLoginState extends State<PersonalLogin> {
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
                "Personal",
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
      await prefs.setBool('isPersonalLogin', true);
      await prefs.setBool('isMedicalLogin', false);

      String userId = userCredential.user!.uid;

      // Retrieve user details from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      // Check if user details completion status is true or false
      bool detailsCompleted =
          (snapshot.data() as Map<String, dynamic>?)?['detailsCompleted'] ??
              false;

      Navigator.pop(context);
      print(detailsCompleted);
      if (detailsCompleted) {
        Navigator.pushReplacementNamed(context, "personal/main");
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
