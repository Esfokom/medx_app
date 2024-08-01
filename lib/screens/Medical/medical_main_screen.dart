import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/providers/doctor_provider.dart';
import 'package:medx/screens/Medical/Top-Level-Tabs/home/medical_home.dart';
import 'package:medx/screens/Medical/Top-Level-Tabs/messaging/medical_messaging.dart';
import 'package:medx/screens/Medical/Top-Level-Tabs/notifications/medical_notifications.dart';
import 'package:medx/screens/Medical/Top-Level-Tabs/profile/medical_profile.dart';
import 'package:medx/screens/Medical/Top-Level-Tabs/records/medical_records.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalMainScreen extends StatefulWidget {
  const MedicalMainScreen({super.key});

  @override
  State<MedicalMainScreen> createState() => _MedicalMainScreenState();
}

class _MedicalMainScreenState extends State<MedicalMainScreen> {
  DoctorModel? doctor;
  bool loaded = false;
  Future<void>? fetchDoctorFuture;
  int bottomNavIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchDoctorFuture = fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded)
      return Center(
        child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.redAccent,
            ))),
      );
    return FutureBuilder(
      future: fetchDoctorFuture,
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              leading: Image.asset("assets/images/MedX logo.png"),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.black,
              buttonBackgroundColor: Colors.red,
              animationDuration: Duration(milliseconds: 200),
              index: bottomNavIndex,
              onTap: (index) {
                setState(() {
                  bottomNavIndex = index;
                });
              },
              items: [
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                Icon(
                  FontAwesomeIcons.fileMedical,
                  color: Colors.white,
                ),
                Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                Icon(
                  FontAwesomeIcons.comment,
                  color: Colors.white,
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                )
              ],
            ),
            body: selectedWidget(bottomNavIndex),
          ),
        );
      },
    );
  }

  Widget selectedWidget(index) {
    switch (index) {
      case 0:
        return MedicalNotifications();
        break;
      case 1:
        return MedicalRecords();
        break;
      case 2:
        return MedicalHome();
        break;
      case 3:
        return MedicalMessaging();
        break;
      case 4:
        return MedicalProfile();
      default:
        return MedicalHome();

        break;
    }
  }

  Future<void> fetchUser() async {
    try {
      final userCredentials = await FirebaseAuth.instance.currentUser!.uid;
      final details = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(userCredentials)
          .get();
      if (!details.exists) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isMedicalLogin", false);
        Navigator.pushNamed(context, "onboarding");
        return;
      }
      print(details.data());
      setState(() {
        doctor = DoctorModel.fromJson(details.data()!);
      });

      Provider.of<DoctorProvider>(context, listen: false)
          .setDoctorModel(doctor!);
      setState(() {
        loaded = true;
      });
      print(doctor == null);
    } on FirebaseException catch (e) {
      print(e.code);
    } on Exception catch (e) {
      print(e);
    }
  }
}
