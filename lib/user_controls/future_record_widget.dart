import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/user_controls/next_button.dart';

import 'MedicalInfo.dart';

class FutureRecordWidget extends StatefulWidget {
  const FutureRecordWidget({super.key, required this.documentID});
  final String documentID;

  @override
  State<FutureRecordWidget> createState() => _FutureRecordWidgetState();

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

class _FutureRecordWidgetState extends State<FutureRecordWidget> {
  @override
  Widget build(BuildContext context) {
    CollectionReference records =
        FirebaseFirestore.instance.collection('records');

    return FutureBuilder(
        future: records.doc(widget.documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: FutureRecordWidget.cardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${data['title']}",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ),
                    ),
                    Medicalinfo(
                        fieldKey: "Doctor",
                        fieldValue: "${data['doctorName']}"),
                    Medicalinfo(
                        fieldKey: "Hospital",
                        fieldValue: "${data['hospital']}"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${data['recordText']}",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: NextButton(
                        formValid: true,
                        onTap: () async {
                          //await deleteRecord();
                        },
                        text: "Delete record",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          }
          return Text("Loading");
        }));
  }

  Future<void> deleteRecord() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    CollectionReference records =
        FirebaseFirestore.instance.collection('records');
    await records.doc(widget.documentID).delete();
    setState(() {});
    Navigator.pop(context);
  }
}
