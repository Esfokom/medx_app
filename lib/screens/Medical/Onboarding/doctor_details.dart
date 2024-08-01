import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:medx/screens/Medical/Onboarding/other_details.dart';
import 'package:medx/user_controls/user_controls.dart';
import 'package:provider/provider.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  TextEditingController speciality = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController experience = TextEditingController();
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
              Text("Doctor Details", style: headerStyle),
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
              const SizedBox(
                height: 20,
              ),
              CustomFieldWithPretext(
                fieldText: "Speciality",
                hintText: "Enter speciality",
                textEditingController: speciality,
                preText: "Enter your speciality\neg. Cardiologist",
                onChanged: (value) {
                  setState(() {
                    formValid = validateForm();
                  });
                },
              ),
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
                  preText:
                      "Enter the name of your primary hospital.\neg. Apollo Hospital"),
              const SizedBox(
                height: 20,
              ),
              CustomFieldWithPretext(
                fieldText: "Experience",
                hintText: "Enter experience",
                textEditingController: experience,
                preText: "Years of experience\n(eg. 5 years)",
                onChanged: (value) {
                  setState(() {
                    formValid = validateForm();
                  });
                },
              ),
              const SizedBox(
                height: 80,
              ),
              NextButton(
                  formValid: formValid,
                  text: "Next",
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
                    setDoctorDetails();
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

  void setDoctorDetails() async {
    DoctorModel? doctor =
        Provider.of<DoctorProvider>(context, listen: false).doctorModel;
    doctor.speciality = speciality.text;
    doctor.hospital = hospital.text;
    doctor.experience = experience.text;

    Provider.of<DoctorProvider>(context, listen: false).setDoctorModel(doctor);
  }

  bool validateForm() {
    if (speciality.text.trim().isEmpty) return false;
    if (hospital.text.trim().isEmpty) return false;
    if (experience.text.trim().isEmpty) return false;
    return true;
  }

  static TextStyle headerStyle = GoogleFonts.poppins(
      color: Colors.redAccent, fontWeight: FontWeight.w400, fontSize: 30);
}
