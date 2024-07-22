import 'package:asset_management/check.dart';
import 'package:flutter/material.dart';
import 'package:asset_management/frontpage.dart';
void main() {
  runApp(check());
}

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Management',
      debugShowCheckedModeBanner: false,
      routes: {
        "/homepage": (context) =>  StorageUpload(),
      },
      home:const FrontPage(),
      theme: ThemeData.dark(),
    );
  }
}