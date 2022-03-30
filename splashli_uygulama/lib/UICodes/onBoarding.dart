import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  PageController controller = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    child: PageView(
                      controller: controller,
                      children: [
                        onBoardingInfos(
                          imageName: "assets/firstboard.jpeg",
                          onBoardExplanation:
                              "Moda ve Magazin haberlerine anında ulaş!",
                          expFont: 20,
                          textPadding: 70,
                        ),
                        onBoardingInfos(
                          imageName: "assets/secondboard.jpeg",
                          onBoardExplanation: "2019/20 Makyaj trendleri",
                          expFont: 20,
                          textPadding: 70,
                        ),
                        onBoardingInfos(
                          imageName: "assets/thirdboard.jpeg",
                          onBoardExplanation:
                              "Modanın gündemimize düşenlerinden Güzellik dünyasındaki her şeye. "
                              "Sokak stillerine, yeniye dair her şeyi sizinle paylaşıyoruz.",
                          expFont: 20,
                          textPadding: 25,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SmoothPageIndicator(
                    effect: ScrollingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white,
                        dotHeight: 10),
                    controller: controller,
                    count: 3,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              print("sonraki");
                              controller.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.bounceOut);
                            },
                            child: Text(
                              "SONRAKİ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print("ATLA");
                              Navigator.pushNamed(context, "loginScreen");
                            },
                            child: Text(
                              "ATLA",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.transparent,
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

class onBoardingInfos extends StatelessWidget {
  String imageName;
  String onBoardExplanation;
  double expFont;
  double textPadding;
  onBoardingInfos(
      {this.imageName,
      this.onBoardExplanation,
      this.expFont,
      this.textPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 400,
              ),
              SizedBox(
                height: textPadding,
              ),
              Center(
                child: Text(
                  onBoardExplanation,
                  style: TextStyle(fontSize: expFont, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
