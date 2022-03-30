import 'package:flutter/material.dart';
import 'package:splashli_uygulama/UICodes/signUpPage.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController forgotEmailController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        print("geri");
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    "assets/forgotPassword.png",
                    height: 220.0,
                    width: 220.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Kullanıcı e-posta adresinizi giriniz. \n Şifrenizi yeniden sağlamak için size bir sıfırlama bağlantısı göndereceğiz.",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Signupfield(forgotEmailController, Icons.email,
                  TextInputType.emailAddress),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  "Sıfırlama bağlantısını gönder",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
