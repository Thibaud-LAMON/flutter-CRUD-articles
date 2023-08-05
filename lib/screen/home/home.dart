import 'package:article/model/userModel/userModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  //const Home({super.key});
  final VoidCallback? login;
  Home({this.login});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.rightFromBracket, color: Colors.white,), onPressed: (){
            widget.login?.call();
            UserModel.logOut();
          })
        ],
      ),
      body: Container(
        child: Center(
            child: ElevatedButton(onPressed: (){UserModel.getUser();}, child: null,)
        ),
      ),
    );
  }
}
