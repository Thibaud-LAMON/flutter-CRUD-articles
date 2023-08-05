import 'package:article/screen/authentication/login.dart';
import 'package:article/screen/authentication/register.dart';
import 'package:article/screen/home/home.dart';
import 'package:flutter/material.dart';

import '../model/userModel/userModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true, login = false;
  isconnected() async{
    await UserModel.getUser();
    if(UserModel.sessionUser == null){
      setState(() {
        login = false;
      });
    }else{
      login = true;
    }
  }
  toggle(){
    setState(() {
      visible = !visible;
    });
  }
  islogin(){
    setState(() {
      login=!login;
    });
  }
  @override
  Widget build(BuildContext context) {
    return login?Home():visible?Login(toggle, islogin):Register(toggle);
  }
}
