import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/user_controls/user_controls.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({super.key});

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  TextEditingController doctorName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController record = TextEditingController();
  bool formValid = false;
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/MedX logo.png",
                    height: 200,
                  ),
                ),
                CustomFieldWithPretext(
                    fieldText: "Title",
                    hintText: "Enter record title",
                    onChanged: (value) {
                      setState(() {
                        formValid = validateForm();
                      });
                    },
                    textEditingController: title,
                    preText: "This is the title of the record."
                        " It should give a short description of the record.\neg.Malaria test "),
                const SizedBox(
                  height: 20,
                ),
                CustomFieldWithPretext(
                    fieldText: "Doctor Name",
                    onChanged: (value) {
                      setState(() {
                        formValid = validateForm();
                      });
                    },
                    hintText: "Enter name of doctor",
                    textEditingController: doctorName,
                    preText:
                        "This is the name of the doctor in charge of the record"),
                const SizedBox(
                  height: 20,
                ),
                CustomFieldWithPretext(
                    fieldText: "Hospital",
                    onChanged: (value) {
                      setState(() {
                        formValid = validateForm();
                      });
                    },
                    hintText: "Enter hospital name",
                    textEditingController: hospital,
                    preText:
                        "Enter the name of the hospital in charge of the record"),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 1)),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Record",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, left: 6, right: 2),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 5,
                              canRequestFocus: true,
                              onTap: () {},
                              onChanged: (value) {
                                setState(() {
                                  formValid = validateForm();
                                });
                              },
                              controller: record,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                              decoration: const InputDecoration(
                                filled: false,
                                border: InputBorder.none,
                                hintText: "Enter Record",
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                NextButton(
                  formValid: formValid,
                  onTap: () {
                    if (clicked) return;
                    if (!formValid) return;
                    setState(() {
                      clicked = true;
                    });
                    FirebaseFirestore.instance.collection('records').add({
                      'title': title.text,
                      'doctorName': doctorName.text,
                      'hospital': hospital.text,
                      'recordText': record.text,
                      'time': DateTime.now()
                    }).then(
                      (value) {
                        setState(() {
                          clicked = false;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                  text: "Submit Record",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateForm() {
    if (title.text == "") return false;
    if (doctorName.text == "") return false;
    if (hospital.text == "") return false;
    if (record.text == "") return false;
    return true;
  }
}
