import 'package:article/model/userModel/userModel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ElevatedButton(onPressed: (){UserModel.getUser();}, child: null,)
        ),
      ),
    );
  }
}
