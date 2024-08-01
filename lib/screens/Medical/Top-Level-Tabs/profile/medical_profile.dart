import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:medx/screens/Medical/medical_screens.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalProfile extends StatefulWidget {
  const MedicalProfile({super.key});

  @override
  State<MedicalProfile> createState() => _MedicalProfileState();
}

class _MedicalProfileState extends State<MedicalProfile> {
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 55,
                    right: 20,
                    left: 20,
                  ),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
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
                            begin: Alignment.topCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                            child: Text(
                          "${doctor!.firstName} ${doctor!.lastName}",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        )),
                        Center(
                          child: Text(
                            "${calculateAge(doctor!.dateOfBirth!)} years, ${doctor!.city}",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Gender",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  doctor!.gender!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Height",
                                  style: cardFieldTextStyle,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  doctor!.height!,
                                  style: cardDetailTextStyle,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Weight",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  doctor!.weight!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.red.shade300,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red.shade50,
                      backgroundImage: NetworkImage(doctor!.profilePicture!),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Other Details",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.red.shade300),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurStyle: BlurStyle.normal,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                spreadRadius: 0)
                          ],
                          gradient: LinearGradient(colors: [
                            Colors.grey.shade50,
                            Colors.grey.shade300
                          ], begin: Alignment.topCenter)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Date of Birth",
                            style: cardFieldTextStyle,
                          ),
                          Text(
                            doctor!.dateOfBirth!.year.toString(),
                            style: cardDetailTextStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nationality",
                            style: cardFieldTextStyle,
                          ),
                          Text(
                            doctor!.country!,
                            style: cardDetailTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurStyle: BlurStyle.normal,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                spreadRadius: 0)
                          ],
                          gradient: LinearGradient(colors: [
                            Colors.grey.shade50,
                            Colors.grey.shade300
                          ], begin: Alignment.topCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Occupation",
                            style: cardFieldTextStyle,
                          ),
                          Text(
                            doctor!.occupation!,
                            style: cardDetailTextStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Number",
                            style: cardFieldTextStyle,
                          ),
                          Text(
                            doctor!.telephone!,
                            style: cardDetailTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: cardDecoration,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Email",
                        style: cardFieldTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        doctor!.email!,
                        style: cardDetailTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 200,
                decoration: cardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Usual Hospital",
                        style: cardFieldTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        doctor!.primaryHospital!,
                        style: cardDetailTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "NHIS Number",
                        style: cardFieldTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        "N-12312412",
                        style: cardDetailTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Fluent languages",
                        style: cardFieldTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        "English, Twi",
                        style: cardDetailTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: NextButton(
                formValid: true,
                onTap: () {
                  Navigator.pushNamed(context, "medical_data");
                },
                text: "Medical Data",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: NextButton(
                formValid: true,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('isMedicalLogin', false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "onboarding", (Route route) => route.isCurrent);
                },
                text: "Log Out",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  int calculateAge(DateTime dob) {
    DateTime now = DateTime.now();

    // Difference between current date and DOB
    int age = now.year - dob.year;

    // Check if the birthday for this year has already occurred
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    return age;
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
