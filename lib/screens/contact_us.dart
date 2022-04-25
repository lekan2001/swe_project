import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swe_project/widgets/rounded_button.dart';
// import 'package:payhup_app/views/constants.dart';
// import 'package:payhup_app/field_container.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Contact Us",
              style: TextStyle(
                  color: Colors.pink[50],
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: BackButton(color: Colors.pink[50]),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Column(children: <Widget>[
                  Container(
                    height: 100,
                    child: TextFormField(
                      focusNode: new AlwaysDisabledFocusNode(),
                      obscureText: false,
                      initialValue: "John Doe",
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Name",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: TextFormField(
                      obscureText: false,
                      initialValue: "johndoe@gmail.com",
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: TextFormField(
                      obscureText: false,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Message",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RoundedButton(
                      text: "Send",
                      press: () {},
                      color: Colors.pink,
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  new Text("You can also contact us at ",
                      softWrap: true, textAlign: TextAlign.center),
                  new Text("Customersupport@gmail.com",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.pink[50]))
                ]))));
  }
}
