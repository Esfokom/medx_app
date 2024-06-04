import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';

class ProfileScreenMed extends StatelessWidget {
  const ProfileScreenMed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Stephanie Ama Dede",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hospital: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Ridge Experimental Hospital",
                          style: ThemeDictionary.blackText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Speciality: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cardiology",
                          style: ThemeDictionary.blackText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "stephamadede@gmail.com",
                          style: ThemeDictionary.blackText,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
