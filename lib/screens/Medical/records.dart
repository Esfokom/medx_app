import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<String> docIds = [];
  Future getDocId() async {
    docIds = [];
    await FirebaseFirestore.instance.collection('records').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            docIds.add(element.reference.id);
            print(element.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDocId(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: docIds.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () async {
                // CollectionReference records =
                //     FirebaseFirestore.instance.collection('records');
                // await records.doc(docIds[index]).delete();
              },
              child: FutureRecordWidget(
                documentID: docIds[index],
              ),
            );
          },
        );
      },
    );
  }
}
