import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        elevation: 30,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Material(
                elevation: 20,
                child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            print("Settings");
                            Navigator.pushNamed(context, 'settingsPage');
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 20, bottom: 10),
                        child: Text(
                          //Gökay yazan yere sonradan başka yerden alınan data gelecek ${} olarak!!!
                          "Merhaba Gökay!",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "gokaydinc2000@gmail.com",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    drawerOptions(
                      optionName: "Bakım Ürünleri",
                      optionIcon: Icons.shopping_cart,
                      optionFunction: () {
                        Navigator.pushNamed(context, 'productsPage');
                      },
                    ),
                    drawerOptions(
                      optionIcon: Icons.star,
                      optionName: "Dergiler",
                    ),
                    drawerOptions(
                      optionName: "Dergiye Abone Ol",
                      optionIcon: Icons.check_box,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(FontAwesomeIcons.youtube),
                            onPressed: () {
                              print("Youtube Sitesine aktarır");
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.facebook),
                            onPressed: () {
                              print("Facebook Sitesine aktarır");
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.instagram),
                            onPressed: () {
                              print("Instagram Sitesine aktarır");
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.pinterest),
                            onPressed: () {
                              print("Pinterest Sitesine aktarır");
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.twitter),
                            onPressed: () {
                              print("Twitter Sitesine aktarır");
                            },
                          ),
                        ],
                      ),
                    ),
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

class drawerOptions extends StatelessWidget {
  String optionName;
  IconData optionIcon;
  Function optionFunction;
  drawerOptions({this.optionName, this.optionIcon, this.optionFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          optionFunction();
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: Icon(optionIcon),
              ),
              Text(
                "${optionName}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
