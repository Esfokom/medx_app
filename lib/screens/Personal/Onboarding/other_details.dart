import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/CustomMethods/Validation_Methods.dart';
import 'package:medx/models/user_model.dart';
import 'package:medx/providers/user_provider.dart';
import 'package:medx/screens/Personal/personal_main_screen.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:provider/provider.dart';

class OtherDetails extends StatefulWidget {
  const OtherDetails({super.key});

  @override
  State<OtherDetails> createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  TextEditingController telephone = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController city = TextEditingController();
  bool formValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Other Details", style: headerStyle),
              Divider(
                color: Colors.red,
                endIndent: 20,
                indent: 20,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/svg/details.svg",
                  height: 150,
                ),
              ),
              TelephoneField(
                  fieldText: "Telephone",
                  hintText: "Enter telephone",
                  textEditingController: telephone,
                  onChanged: () {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: ""),
              CustomFieldWithPretext(
                  fieldText: "City",
                  hintText: "Enter city",
                  textEditingController: city,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: ""),
              CustomFieldWithPretext(
                  fieldText: "Occupation",
                  hintText: "Enter occupation",
                  textEditingController: occupation,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: ""),
              const SizedBox(
                height: 20,
              ),
              CustomFieldWithPretext(
                  fieldText: "Height",
                  hintText: "Enter height",
                  textEditingController: height,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: "eg. 60cm"),
              const SizedBox(
                height: 20,
              ),
              CustomFieldWithPretext(
                  fieldText: "Weight",
                  hintText: "Enter weight",
                  textEditingController: weight,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: "eg. 80kg"),
              const SizedBox(
                height: 20,
              ),
              CustomFieldWithPretext(
                  fieldText: "Hospital",
                  hintText: "Enter hospital",
                  textEditingController: hospital,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: "Enter the name of your primary hospital"),
              const SizedBox(
                height: 80,
              ),
              NextButton(
                  formValid: formValid,
                  text: "Finish",
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                          ),
                        );
                      },
                    );

                    if (!formValid) return;
                    String userCredentials =
                        FirebaseAuth.instance.currentUser!.uid;
                    DocumentReference ref = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userCredentials);
                    ref.update({
                      'detailsCompleted': true,
                    });
                    setDetails();
                    await uploadProfilePicture();
                    await ref.set(
                        Provider.of<UserProvider>(context, listen: false)
                            .userModel
                            .toJson(),
                        SetOptions(merge: true));

                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalMainScreen(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void setDetails() async {
    UserModel? user =
        Provider.of<UserProvider>(context, listen: false).userModel;
    user.telephone = telephone.text;
    user.city = city.text;
    user.occupation = occupation.text;
    user.height = height.text;
    user.weight = weight.text;
    user.primaryHospital = hospital.text;

    Provider.of<UserProvider>(context, listen: false).setUserModel(user);
  }

  Future<void> uploadProfilePicture() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Create a reference to the location you want to upload to in Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('users/profile/${user.uid}/profile_pic.jpg');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(
          Provider.of<UserProvider>(context, listen: false)
              .userModel
              .profilePic!
              .file);
      await uploadTask;

      // Get the download URL
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL to Cloud Firestore
      // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      //   'profile_pic': downloadURL,
      // }, SetOptions(merge: true));

      Provider.of<UserProvider>(context, listen: false)
          .setProfileUrl(downloadURL);
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  bool validateForm() {
    if (!ValidationMethods.isValidPhoneNumber(telephone.text)) return false;
    if (occupation.text.trim().isEmpty) return false;
    if (height.text.trim().isEmpty) return false;
    if (weight.text.trim().isEmpty) return false;
    if (city.text.trim().isEmpty) return false;
    if (hospital.text.trim().isEmpty) return false;
    return true;
  }

  static TextStyle headerStyle = GoogleFonts.poppins(
      color: Colors.redAccent, fontWeight: FontWeight.w400, fontSize: 30);
}
