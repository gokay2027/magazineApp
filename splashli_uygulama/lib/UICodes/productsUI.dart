import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  List<ProductInfo> liste = [
    ProductInfo(),
    ProductInfo(),
    ProductInfo(),
    ProductInfo(),
    ProductInfo(),
    ProductInfo(),
    ProductInfo(),
  ];

  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 4.7),
                    child: Text(
                      "ÜRÜNLERİMİZ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 10,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 220,
                        mainAxisSpacing: 20),
                    itemCount: liste.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return liste[index];
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  String productName;
  String productImageAsset;
  int productPrice;

  //ProductInfo({this.productName, this.productImageAsset, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              height: 123,
              color: Colors.red,
              child: Image.asset(
                "assets/ceo.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              //38 dan sonra aşağı kayıyor builderda kontrol et
              "Lash Sensational Maskara Sky High",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  "246 TL",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
