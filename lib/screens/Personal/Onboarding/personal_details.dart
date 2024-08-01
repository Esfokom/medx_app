import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medx/models/user_model.dart';
import 'package:medx/providers/user_provider.dart';
import 'package:medx/screens/Personal/Onboarding/other_details.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  DateTime? _dateOfBirth;
  TextEditingController country = TextEditingController();
  FileImage? profilePic;
  bool? gender;

  bool formValid = false;

  FlCountryCodePicker _countryCodePicker = FlCountryCodePicker(
      showDialCode: false,
      showSearchBar: true,
      title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "Select Country",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent),
        ),
      ));
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Basic Information", style: headerStyle),
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
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 105,
                      backgroundColor: Colors.redAccent.shade100,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: profilePic ??
                            AssetImage('assets/images/male avatar.png'),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      bottom: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.shade100,
                        radius: 23,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await imagePicker
                                                    .pickImage(
                                                        source:
                                                            ImageSource.camera)
                                                    .then((value) async {
                                                  if (value == null) return;
                                                  await cropImage(FileImage(
                                                      File(value.path)));
                                                });
                                              },
                                              child: Text("Capture image")),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                final xFile = await imagePicker
                                                    .pickImage(
                                                        source:
                                                            ImageSource.gallery)
                                                    .then((value) async {
                                                  if (value == null) return;
                                                  await cropImage(FileImage(
                                                      File(value.path)));
                                                });
                                              },
                                              child:
                                                  Text("Select from gallery")),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              color: Colors.white,
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.redAccent,
                                size: 25,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomFieldWithPretext(
                  fieldText: "First Name",
                  hintText: "Enter first name",
                  textEditingController: firstName,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: ""),
              CustomFieldWithPretext(
                  fieldText: "Last Name",
                  hintText: "Enter Last name",
                  textEditingController: lastName,
                  onChanged: (value) {
                    setState(() {
                      formValid = validateForm();
                    });
                  },
                  preText: ""),
              const SizedBox(
                height: 30,
              ),
              DialogField(
                textEditingController: dateOfBirth,
                icon: Icon(Icons.calendar_month),
                hintText: "Select your date of birth",
                fieldText: "Date of Birth",
                onTap: () async {
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                      .then((value) {
                    if (value == null) return;
                    setState(() {
                      dateOfBirth.text = formatDate(value);
                      _dateOfBirth = value;
                      formValid = validateForm();
                    });
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTwoWaySelection(
                  fieldText: "Gender",
                  targetBool: gender,
                  trueText: "Male",
                  falseText: "Female",
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                      formValid = validateForm();
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              DialogField(
                textEditingController: country,
                icon: Icon(Icons.flag),
                fieldText: "Country",
                hintText: "Select country",
                onTap: () {
                  _countryCodePicker
                      .showPicker(
                          context: context, backgroundColor: Colors.white)
                      .then((value) {
                    if (value == null) return;
                    setState(() {
                      country.text = value.name;
                      formValid = validateForm();
                    });
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              NextButton(
                  formValid: formValid,
                  onTap: () {
                    if (!formValid) return;
                    setBasicDetails();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtherDetails(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
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
      UploadTask uploadTask = storageReference.putFile(profilePic!.file);
      await uploadTask;

      // Get the download URL
      String downloadURL = await storageReference.getDownloadURL();

      // Save the download URL to Cloud Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'profile_pic': downloadURL,
      }, SetOptions(merge: true));

      print('Profile picture uploaded successfully.');
    } catch (e) {
      print('Error uploading profile picture: $e');
    }
  }

  bool validateForm() {
    if (firstName.text.trim().isEmpty) return false;
    if (lastName.text.trim().isEmpty) return false;
    if (_dateOfBirth == null) return false;
    if (gender == null) return false;
    if (profilePic == null) return false;
    if (country.text.trim().isEmpty) return false;
    return true;
  }

  Future<void> cropImage(FileImage selctedImage) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: selctedImage.file.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.redAccent,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.dialog,
          size: const CropperSize(
            width: 520,
            height: 520,
          ),
        ),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        profilePic = FileImage(File(croppedFile.path));
        formValid = validateForm();
      });
    }
  }

  void setBasicDetails() async {
    UserModel user = UserModel();
    user.firstName = firstName.text;
    user.lastName = lastName.text;
    user.dateOfBirth = _dateOfBirth;
    user.gender = gender! ? "Male" : "Female";
    user.country = country.text;
    user.profilePic = profilePic;
    user.email = await FirebaseAuth.instance.currentUser?.email;

    Provider.of<UserProvider>(context, listen: false).setUserModel(user);
  }

  String formatDate(DateTime date) {
    // Get the day of the month
    int day = date.day;

    // Determine the appropriate suffix for the day
    String suffix = _getDaySuffix(day);
    // Parse the input date in the format "1-12-2005"
    String formattedDate =
        DateFormat('EEEE, d\'$suffix\' MMMM yyyy').format(date);
    // Format the date using intl package
    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static TextStyle headerStyle = GoogleFonts.poppins(
      color: Colors.redAccent, fontWeight: FontWeight.w400, fontSize: 30);
}
