import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationValue = true;
  bool emailValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "AYARLAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 20, left: 20, bottom: 10),
                  child: Column(
                    children: [
                      OptionSelection(
                        optionName: "Anlık bildirimler",
                        switchValue: notificationValue,
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      OptionSelection(
                        optionName: "E-posta Bildirimleri",
                        switchValue: emailValue,
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionSelection extends StatefulWidget {
  bool switchValue = true;
  String optionName;

  OptionSelection({this.switchValue, this.optionName});

  @override
  _OptionSelectionState createState() => _OptionSelectionState();
}

class _OptionSelectionState extends State<OptionSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.optionName}",
          style: TextStyle(fontSize: 20),
        ),
        CupertinoSwitch(
            trackColor: Colors.black,
            value: widget.switchValue,
            onChanged: (value) {
              setState(() {
                widget.switchValue = !widget.switchValue;
                print("${widget.optionName}");
                print(widget.switchValue);
              });
            })
      ],
    );
  }
}
