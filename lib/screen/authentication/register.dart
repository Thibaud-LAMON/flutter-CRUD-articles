import 'package:article/widgets/customTextField.dart';
import 'package:flutter/material.dart';

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
                    emailText.textformfield(),
                    SizedBox(height: 10,),
                    passText.textformfield(),
                    SizedBox(height: 10,),
                    confirmPassText.textformfield(),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      if(_key.currentState!.validate()){
                        print(emailText.value);
                        print("ok");
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
