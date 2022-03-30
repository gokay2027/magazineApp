import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();
  bool hide = true;
  var SuffixIcon = Icons.remove_red_eye_outlined;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 25),
                  child: Container(
                    child: Image.asset(
                      "assets/magazinlogo.jpg",
                      fit: BoxFit.fill,
                    ),
                    color: Colors.white,
                    width: 300,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "E-Posta",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
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
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15),
                child: Text(
                  "Şifre",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: passwordController,
                    obscureText: hide,
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
                            if (hide == true) {
                              hide = false;
                              SuffixIcon = Icons.remove_red_eye;
                              print(hide);
                            } else {
                              hide = true;
                              SuffixIcon = Icons.remove_red_eye_outlined;
                              print(hide);
                            }
                          });
                        },
                        icon: Icon(SuffixIcon),
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
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Şifremi unuttum",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "forgotPasswordScreen");
                      print("şifremi unuttum :(");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    print("selamm");
                    print(usernameController.text);
                    print(passwordController.text);

                    Navigator.pushNamed(context, "generalPage");
                  },
                  child: Text(
                    "Oturum Aç",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextButton(
                  onPressed: () {
                    print("Kayıt Ol");
                    Navigator.pushNamed(context, 'signUpScreen');
                  },
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: TextButton(
                  onPressed: () {
                    print("Şartlar ve Koşullar");
                  },
                  child: Text(
                    "Şartlar ve Koşullar",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
