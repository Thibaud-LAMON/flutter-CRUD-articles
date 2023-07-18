import 'package:article/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter email"
  );
  CustomTextField passText = new CustomTextField(
      title: "Password",
      placeholder: "*****",
      ispass: true
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Login", textAlign : TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                SizedBox(height: 30,),
                emailText.textformfield(),
                SizedBox(height: 10,),
                passText.textformfield(),
                ElevatedButton(onPressed: (){},
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
                        onPressed: () {},
                        child: (Text("Register", style: TextStyle(color: Colors.redAccent),))
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//reprendre à 16:15
