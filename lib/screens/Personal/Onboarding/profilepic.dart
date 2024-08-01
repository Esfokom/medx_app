import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:medx/user_controls/next_button.dart';
import 'package:image_picker/image_picker.dart';

class Profilepic extends StatefulWidget {
  const Profilepic({super.key});

  @override
  State<Profilepic> createState() => _ProfilepicState();
}

class _ProfilepicState extends State<Profilepic> {
  ImagePicker imagePicker = ImagePicker();
  FileImage? profilePic;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Picture", style: headerStyle),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/svg/male avatar.svg",
                    height: 150,
                  ),
                  SvgPicture.asset(
                    "assets/svg/female avatar.svg",
                    height: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).width * 0.75,
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: cardDecoration,
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: profilePic ??
                          AssetImage("assets/images/MedX logo.png"),
                    ),
                  ),
                ),
              ),
            ),
            NextButton(
                formValid: true,
                text: "Select Image",
                onTap: () async {
                  final xFile = await imagePicker
                      .pickImage(source: ImageSource.gallery)
                      .then((value) async {
                    if (value == null) return;
                    await cropImage(FileImage(File(value.path)));
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            NextButton(
                formValid: true,
                text: "Capture Image",
                onTap: () async {
                  await imagePicker
                      .pickImage(source: ImageSource.camera)
                      .then((value) async {
                    if (value == null) return;
                    await cropImage(FileImage(File(value.path)));
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            NextButton(formValid: true, text: "Proceed", onTap: () {})
          ],
        ),
      ),
    ));
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
      });
    }
  }

  static TextStyle headerStyle = GoogleFonts.poppins(
      color: Colors.redAccent, fontWeight: FontWeight.w400, fontSize: 30);
  static TextStyle cardFieldTextStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static TextStyle cardDetailTextStyle =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);
  static BoxDecoration cardDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.black54,
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            offset: Offset(0, 3),
            spreadRadius: 0)
      ],
      gradient: LinearGradient(
          colors: [Colors.grey.shade50, Colors.grey.shade300],
          begin: Alignment.topCenter));
}
