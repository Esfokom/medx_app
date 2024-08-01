import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/models/user_model.dart';
import 'package:medx/providers/user_provider.dart';
import 'package:provider/provider.dart';

class PersonalHome extends StatefulWidget {
  const PersonalHome({super.key});

  @override
  State<PersonalHome> createState() => _PersonalHomeState();

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

class _PersonalHomeState extends State<PersonalHome> {
  UserModel? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).userModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: PersonalHome.cardDecoration,
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
                            Provider.of<UserProvider>(context)
                                .userModel
                                .profilePicture!)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Hello, ${user!.firstName} 👋",
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
              decoration: PersonalHome.cardDecoration,
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
}
