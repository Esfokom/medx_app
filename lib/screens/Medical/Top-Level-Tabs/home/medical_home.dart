import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:provider/provider.dart';

class MedicalHome extends StatefulWidget {
  const MedicalHome({super.key});

  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  DoctorModel? doctor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      doctor = Provider.of<DoctorProvider>(context, listen: false).doctorModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              decoration: cardDecoration,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.red.shade300,
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red.shade50,
                        backgroundImage: NetworkImage(
                            Provider.of<DoctorProvider>(context)
                                .doctorModel
                                .profilePicture!)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hello, ${doctor!.firstName} 👋",
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Patients",
                  style: GoogleFonts.poppins(
                      color: Colors.red.shade300,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: cardDecoration,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "No assigned patients yet...",
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Activities",
                  style: GoogleFonts.poppins(
                      color: Colors.red.shade300,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: cardDecoration,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "No activities yet...",
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
