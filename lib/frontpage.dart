import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
                child: Text(
              "The Asset\nManagement System",
              style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 176, 156, 57),
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 90,
            ),
            TextField(
              controller: username,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 231, 231),
                  hintText: "USERNAME",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              obscureText: true,
              controller: password,
              obscuringCharacter: '●',
              style: TextStyle(color: Colors.black,
              fontSize: 10
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 232, 231, 231),
                  hintText: "PASSWORD",
                  hintStyle: TextStyle(color: Colors.black,fontSize: 16)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (password.text == "abc" && username.text == "admin") {
                    Navigator.pushNamed(context, "/homepage");
                  } else {
                    setState(() {
                      AnimatedContainer(child: Text("not available"),
                        duration: Duration(microseconds: 2));
                    });
                  }
                },
                child: Text("LOGIN"))
          ],
        ),
      )),
    );
  }
}
