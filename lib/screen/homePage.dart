import 'package:article/screen/authentication/login.dart';
import 'package:article/screen/authentication/register.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = false;
  toggle(){
    setState(() {
      visible = !visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return visible? Login(toggle):Register(toggle);
  }
}
