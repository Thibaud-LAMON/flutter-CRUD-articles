import 'dart:convert';
import 'package:article/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  //const Register({super.key});
  final VoidCallback? visible;
  Register(this.visible);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  CustomTextField emailText = new CustomTextField(
      title: "Email",
      placeholder: "Enter email"
  );
  CustomTextField nameText = new CustomTextField(
      title: "Name",
      placeholder: "Enter name"
  );
  void register(String name, String email, String pass)async{
    final response = await http.post(Uri.parse("https://pubescent-securitie.000webhostapp.com/article/register.php"), body: {
      "name":name,
      "email":email,
      "pass":pass
    });
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      print(data);
    }
  }
  CustomTextField passText = new CustomTextField(
      title: "Password",
      placeholder: "*****",
      ispass: true
  );
  CustomTextField confirmPassText = new CustomTextField(
      title: "Confirm Password",
      placeholder: "*****",
      ispass: true
  );
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    nameText.err = "enter name";
    passText.err = "enter password";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Register", textAlign : TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                    SizedBox(height: 30,),
                    nameText.textformfield(),
                    SizedBox(height: 10,),
                    emailText.textformfield(),
                    SizedBox(height: 10,),
                    passText.textformfield(),
                    SizedBox(height: 10,),
                    confirmPassText.textformfield(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      if(passText.value==confirmPassText.value){
                        register(nameText.value, emailText.value, passText.value);
                      }else{
                        print("les mots de passes sont différents");
                      }
                    },
                      child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20),),
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
                            child: (Text("Login", style: TextStyle(color: Colors.redAccent),))
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
