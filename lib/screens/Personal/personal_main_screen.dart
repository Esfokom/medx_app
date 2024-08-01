import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medx/models/user_model.dart';
import 'package:medx/providers/user_provider.dart';
import 'package:medx/screens/Personal/personal_screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalMainScreen extends StatefulWidget {
  const PersonalMainScreen({super.key});

  @override
  State<PersonalMainScreen> createState() => _PersonalMainScreenState();
}

class _PersonalMainScreenState extends State<PersonalMainScreen> {
  UserModel? user;
  int bottomNavIndex = 2;
  bool loaded = false;
  Future<void>? fetchUserFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchUserFuture = fetchUser();
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set your desired color here
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchUserFuture,
      builder: (context, snapshot) {
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
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Image.asset("assets/images/MedX logo.png"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                ),
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
            body: SingleChildScrollView(child: selectedWidget(bottomNavIndex)),
          ),
        );
      },
    );
  }

  Widget selectedWidget(index) {
    switch (index) {
      case 0:
        return PersonalNotifications();
        break;
      case 1:
        return PersonalRecords();
        break;
      case 2:
        return PersonalHome();
        break;
      case 3:
        return PersonalMessaging();
        break;
      case 4:
        return PersonalProfile();
      default:
        return PersonalHome();

        break;
    }
  }

  Future<void> fetchUser() async {
    try {
      final userCredentials = await FirebaseAuth.instance.currentUser!.uid;
      print(userCredentials);
      final details = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials)
          .get();
      if (!details.exists) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isPersonalLogin", false);
        Navigator.pushNamed(context, "onboarding");
        return;
      }
      print("Got it");
      print(details.data().toString());
      setState(() {
        user = UserModel.fromJson(details.data()!);
      });

      Provider.of<UserProvider>(context, listen: false).setUserModel(user!);
      setState(() {
        loaded = true;
      });
      print(user == null);
    } on FirebaseException catch (e) {
      print(e.code);
    } on Exception catch (e) {
      print(e);
    }
  }
}
