import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Image.asset(
              "assets/images/undraw_Login_re_4vu2.png",
              height: 300,
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          fillColor: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          fillColor: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, "main");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(250, 50),
                        ),
                        child: const Text(
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: const SizedBox(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
