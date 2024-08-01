import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/screens/Personal/Onboarding/get_started.dart';
import 'package:medx/user_controls/custom_field_with_pretext.dart';
import 'package:medx/user_controls/next_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../CustomMethods/Validation_Methods.dart';
import '../../../user_controls/custom_email_field.dart';

class PersonalSignup extends StatefulWidget {
  const PersonalSignup({super.key});

  @override
  State<PersonalSignup> createState() => _PersonalSignupState();
}

class _PersonalSignupState extends State<PersonalSignup> {
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
            mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
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
                padding: EdgeInsets.only(left: 40, right: 40),
                child: CustomFieldWithPretext(
                    fieldText: "Password",
                    hintText: "Enter password",
                    obscureText: true,
                    textEditingController: password,
                    preText: "Enter your password",
                    onChanged: (value) {
                      setState(() {
                        formValid = validateForm();
                      });
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: () {}, child: Text("Forgot password")),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: NextButton(
                    formValid: formValid,
                    text: "Sign Up",
                    onTap: () {
                      signUp();
                    }),
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

  Future<void> signUp() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: Colors.red,
        ));
      },
    );
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      String userId = userCredentials.user!.uid;
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Reference to the user document
        DocumentReference userRef =
            FirebaseFirestore.instance.collection('users').doc(userId);

        // Check if the user document already exists
        DocumentSnapshot snapshot = await transaction.get(userRef);
        if (!snapshot.exists) {
          // Create the user document with initial data
          transaction.set(userRef, {
            'detailsCompleted': false, // Initial completion status
          });
        }
      });
      Navigator.pop(context);
      await ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          dismissDirection: DismissDirection.down,
          duration: Duration(seconds: 5),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.circleCheck,
                color: Colors.green,
              ),
              Text(
                "Successfully created account",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GetStarted(),
          ));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            dismissDirection: DismissDirection.down,
            duration: Duration(seconds: 5),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                Text(
                  "Email already in use",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            dismissDirection: DismissDirection.down,
            duration: Duration(seconds: 5),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                Text(
                  e.code,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        );
      }
    } on Exception catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Okay"))
              ],
            ),
          );
        },
      );
    }
  }
}
