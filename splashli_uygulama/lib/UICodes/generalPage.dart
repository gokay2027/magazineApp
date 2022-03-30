import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashli_uygulama/Datas/magazinData.dart';
import 'package:splashli_uygulama/UICodes/drawerUI.dart';

class GeneralPage extends StatelessWidget {
  PageController MagazineController = PageController(initialPage: 0);

  List<Magazine> magazines = [
    Magazine(
        magazineContent: "Vogue",
        magazineCoverAsset: "assets/vogue.jpg",
        magazineTitle: "Vogue"),
    Magazine(
        magazineContent: "Ceo",
        magazineCoverAsset: "assets/ceo.jpg",
        magazineTitle: "Ceo"),
    Magazine(
        magazineContent: "Bazaar",
        magazineCoverAsset: "assets/bazaar.jpg",
        magazineTitle: "Bazaar")
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerDesign(),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          print("Open Drawer");
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        print("Çıkış!");
                        Navigator.pushReplacementNamed(context, "loginScreen");
                      },
                    ),
                  ],
                ),
                height: 60,
                color: Colors.black,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "DERGİLERDE BU AY",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Expanded(
                child: PageView.builder(
                  controller: MagazineController,
                  itemCount: magazines.length,
                  itemBuilder: (context, index) {
                    return MagazineCover(
                      magazineCoverAsset: magazines[index].magazineCoverAsset,
                      function: () {
                        print(magazines[index].magazineTitle);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MagazineCover extends StatelessWidget {
  String magazineCoverAsset;
  Function function;
  MagazineCover({this.magazineCoverAsset, this.function});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              function();
            },
            child: Container(
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Image.asset(
                  magazineCoverAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
