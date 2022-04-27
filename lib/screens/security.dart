import 'package:flutter/material.dart';


class Security extends StatefulWidget {
  const Security({
    Key? key,
  }) : super(key: key);

  @override
  SecurityScreenBody createState() => SecurityScreenBody();
}

class SecurityScreenBody extends State<Security> {
  bool faceIdOnAppLunch = false;
  bool faceIdToSendMoney = false;

  @override
  Widget build(BuildContext context) {
    Color grey = const Color(0xFFF2F2F2);
    const double margin_10 = 10.0;
    const double margin_15 = 15.0;
    const double padding_15 = 15.0;
    const double padding_21 = 21.0;
    const double fontSize_18 = 18;
    const double borderRadius_12 = 12;
    Size size = MediaQuery.of(context).size;

    Widget rightArrowButton = Container(
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
                Icons.arrow_right,
                size: 40.0
            )
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Security", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
            color: Colors.pink
        ),
      ),
      //body: Container(
        //color: Colors.pink[50],
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                  padding: EdgeInsets.only(top: padding_15, bottom: padding_15),
                  child: CheckboxListTile(
                    title: const Text("Require Face ID on app lunch",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: faceIdOnAppLunch,

                    onChanged: (bool? value)  {
                      setState(() {
                        faceIdOnAppLunch = value!;
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius_12),
                    color: grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                  padding: EdgeInsets.only(top: padding_15, bottom: padding_15),
                  child: CheckboxListTile(
                    title: const Text("Require Face ID to access notes",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: faceIdToSendMoney,
                    onChanged: (bool? value) {
                      setState(() {
                        faceIdToSendMoney = value!;
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius_12),
                    color: grey,
                  ),
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                      padding: EdgeInsets.only(top: padding_21, bottom: padding_21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius_12),
                        color: grey,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                            width: size.width * 0.72,
                            child: Text(
                                "Change PIN",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                          ),
                          rightArrowButton,
                        ],
                      )
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                      padding: EdgeInsets.only(top: padding_21, bottom: padding_21),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius_12),
                        color: grey,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: margin_10, bottom: margin_10, left: margin_15, right: margin_15),
                            width: size.width * 0.72,
                            child: Text(
                                "Change password",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                          ),
                          rightArrowButton,
                        ],
                      )
                  ),
                  onTap: () {},
                )
              ],
            )),
      //),
    );
  }
}