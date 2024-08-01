import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/CustomMethods/Validation_Methods.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:medx/screens/Medical/medical_main_screen.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    try {
                      String userCredentials =
                          FirebaseAuth.instance.currentUser!.uid;
                      DocumentReference ref = await FirebaseFirestore.instance
                          .collection('doctors')
                          .doc(userCredentials);
                      ref.update({
                        'detailsCompleted': true,
                      });
                      setDetails();
                      DoctorModel model =
                          Provider.of<DoctorProvider>(context, listen: false)
                              .doctorModel;
                      print(model.toJson());
                      await uploadProfilePicture();
                      await ref.set(
                          Provider.of<DoctorProvider>(context, listen: false)
                              .doctorModel
                              .toJson(),
                          SetOptions(merge: true));
                      print("Success 3");
                    } on FirebaseException catch (e) {
                      Navigator.pop(context);
                      await ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.message!),
                        ),
                      );
                    }

                    SharedPreferences refs =
                        await SharedPreferences.getInstance();
                    refs.setBool('isMedicalLogin', true);

                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicalMainScreen(),
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
    DoctorModel? doctor =
        Provider.of<DoctorProvider>(context, listen: false).doctorModel;
    doctor.telephone = telephone.text;
    doctor.city = city.text;
    doctor.occupation = occupation.text;
    doctor.height = height.text;
    doctor.weight = weight.text;
    doctor.primaryHospital = hospital.text;

    Provider.of<DoctorProvider>(context, listen: false).setDoctorModel(doctor);
  }

  Future<void> uploadProfilePicture() async {
    try {
      // Get the current user
      User? doctor = FirebaseAuth.instance.currentUser;
      if (doctor == null) return;

      // Create a reference to the location you want to upload to in Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('doctors/profile/${doctor.uid}/profile_pic.jpg');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(
          Provider.of<DoctorProvider>(context, listen: false)
              .doctorModel
              .profilePic!
              .file);
      await uploadTask;

      // Get the download URL
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL to Cloud Firestore
      // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      //   'profile_pic': downloadURL,
      // }, SetOptions(merge: true));

      Provider.of<DoctorProvider>(context, listen: false)
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
