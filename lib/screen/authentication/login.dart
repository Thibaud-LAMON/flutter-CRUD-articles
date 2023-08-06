import 'dart:convert';
import 'package:article/crypt/encrypt.dart';
import 'package:article/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:article/model/userModel/userModel.dart';
import '../../widgets/loading.dart';

class Login extends StatefulWidget {
  //const Login({super.key});
  //final Function visible;
  final VoidCallback? visible, login;
  Login(this.visible, this.login);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String err = "";
  bool _loading = false;
  Future<void> login(String email, String pass) async{
    setState(() {
      err = "";
      _loading = true;
    });
    final response = await http.post(Uri.parse("https://pubescent-securitie.000webhostapp.com/article/login.php"), body:{
      "email": encrypt(email),
      "pass": encrypt(pass)
    });
    if(response.statusCode == 200){
      var data = jsonDecode(decrypt(response.body));
      var result = data["data"];
      print(result);
      int success = result[1];
      if(success == 1){
        setState(() {
          err = result[0];
          UserModel.saveUser(UserModel.fromJson(result[2]));
          _loading = false;
          widget.login?.call();
        });
      }else{
        setState(() {
          err = result[0];
          _loading = false;
        });
      }
    }
  }
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter email"
  );
  CustomTextField passText = new CustomTextField(
      title: "Password",
      placeholder: "*****",
      ispass: true
  );
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    passText.err = "enter password";
    return _loading?Loading():Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Login", textAlign : TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                  SizedBox(height: 30,),
                  emailText.textformfield(),
                  SizedBox(height: 10,),
                  passText.textformfield(),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () async{
                    if(_key.currentState!.validate()){
                      login(emailText.value, passText.value);
                    }
                  },
                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(.7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Avez-vous un compte ?"),
                      TextButton(
                          onPressed: widget.visible,
                          child: (Text("Register", style: TextStyle(color: Colors.redAccent),))
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(err, style: TextStyle(color: Colors.red), textAlign: TextAlign.center,)
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
