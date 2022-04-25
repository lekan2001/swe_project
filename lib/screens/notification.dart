import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  NotificationScreenBody createState() => NotificationScreenBody();
}

class NotificationScreenBody extends State<NotificationScreen> {
  bool paymentAlert = false;
  bool emailNotification = false;
  bool accountBalance = false;

  @override
  Widget build(BuildContext context) {
    Color grey = Color(0xFFF2F2F2);
    const double topBottomMargin = 10.0;
    const double leftRightMargin = 15.0;
    const double topBottomPadding = 15.0;
    const double fontSize_18 = 18;
    const double borderRadius_12 = 12;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification", style: TextStyle(color: Colors.pink[50], fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
            color: Colors.pink[50]
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: topBottomMargin, bottom: topBottomMargin, left: leftRightMargin, right: leftRightMargin),
                padding: EdgeInsets.only(top: topBottomPadding, bottom: topBottomPadding),
                child: CheckboxListTile(
                  title: Text("Book alerts",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: paymentAlert,
                  onChanged: (bool? value) {
                    setState(() {
                      paymentAlert = value!;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius_12),
                  color: grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: topBottomMargin, bottom: topBottomMargin, left: leftRightMargin, right: leftRightMargin),
                padding: EdgeInsets.only(top: topBottomPadding, bottom: topBottomPadding),
                child: CheckboxListTile(
                  title: Text("Email notification",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: emailNotification,
                  onChanged: (bool? value) {
                    setState(() {
                      emailNotification = value!;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius_12),
                  color: grey,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: topBottomMargin, bottom: topBottomMargin, left: leftRightMargin, right: leftRightMargin),
                padding: EdgeInsets.only(top: topBottomPadding, bottom: topBottomPadding),
                child: CheckboxListTile(
                  title: Text("Display favorite books",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize_18)),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: accountBalance,
                  onChanged: (bool? value) {
                    setState(() {
                      accountBalance = value!;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius_12),
                  color: grey,
                ),
              ),
            ],
          )),
    );
  }
}