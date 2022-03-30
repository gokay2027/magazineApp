import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool acceptedContract = false;
  bool hide = true;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  IconData SuffixIcon = Icons.remove_red_eye_outlined;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                FieldName("Adınız:"),
                Signupfield(nameController, Icons.account_circle_outlined,
                    TextInputType.text),
                FieldName("Soyadınız:"),
                Signupfield(surnameController, Icons.account_circle,
                    TextInputType.text),
                FieldName("E-Posta:"),
                Signupfield(
                    emailController, Icons.email, TextInputType.emailAddress),
                FieldName("Şifre:"),
                SignUpFieldPassword(passwordController, SuffixIcon),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border(
                            top: BorderSide(width: 2.0, color: Colors.white),
                            left: BorderSide(width: 2.0, color: Colors.white),
                            right: BorderSide(width: 2.0, color: Colors.white),
                            bottom: BorderSide(width: 2.0, color: Colors.white),
                          ),
                        ),
                        child: Checkbox(
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            value: acceptedContract,
                            onChanged: (bool value) {
                              setState(() {
                                acceptedContract = !acceptedContract;
                                print(acceptedContract);
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Text(
                          "Kullanıcı sözleşmesini kabul ediyorum",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        print(nameController.text);
                        print(surnameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Signupfield extends StatefulWidget {
  TextEditingController controller;
  IconData leftIcon;
  TextInputType textInputType;
  Signupfield(this.controller, this.leftIcon, this.textInputType);

  @override
  _SignupfieldState createState() => _SignupfieldState();
}

class _SignupfieldState extends State<Signupfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          height: 65,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.textInputType,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.leftIcon,
                color: Colors.white,
              ),
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FieldName extends StatelessWidget {
  String fieldName;
  FieldName(this.fieldName);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
          child: Text(
            "${fieldName}",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class SignUpFieldPassword extends StatefulWidget {
  TextEditingController passwordController;
  bool hide = true;
  IconData SuffixIcon;

  SignUpFieldPassword(this.passwordController, this.SuffixIcon);

  @override
  _SignUpFieldPasswordState createState() => _SignUpFieldPasswordState();
}

class _SignUpFieldPasswordState extends State<SignUpFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: widget.passwordController,
          obscureText: widget.hide,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  if (widget.hide == true) {
                    widget.hide = false;
                    widget.SuffixIcon = Icons.remove_red_eye;
                    print(widget.hide);
                  } else {
                    widget.hide = true;
                    widget.SuffixIcon = Icons.remove_red_eye_outlined;
                    print(widget.hide);
                  }
                });
              },
              icon: Icon(widget.SuffixIcon),
            ),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
