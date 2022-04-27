

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swe_project/widgets/rounded_button.dart';
import 'package:http/http.dart' as http;
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
  var userNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Contact Us",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: BackButton(color: Colors.pink),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Column(children: <Widget>[
                  Container(
                    height: 100,
                    child: TextFormField(
                      controller: userNameController,
                      obscureText: false,
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
                      controller: userEmailController,
                      obscureText: false,
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
                      controller: userMessageController,
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
                      press: () {
                        sendEmail(
                            userNameController.text.toString(),
                            userEmailController.text.toString(),
                            userMessageController.text.toString()
                        );
                      },
                      color: Colors.pink,
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  new Text("You can also contact us at ",
                      softWrap: true, textAlign: TextAlign.center),
                  new Text("adisaolalekan2016@gmail.com",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.pink))
                ]))));
  }
  Future sendEmail(
       String name,
       String email,
       String message) async{
    final serviceId = 'service_2ae5o8p';
    final templateId = 'template_92q67n4';
    final userId = 'AVucqlEUicOXW5zKS';
    final accessToken = 'r6m0BWtKL4OfAV5GyuN7j';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id' : serviceId,
        'template_id': templateId,
        'user_id' : userId,
        'accessToken' : accessToken,
        'template_params': {
          'user_name' : name,
          'user_email' : email,
          'user_message' : message
        }
      }
      )
    );
    //print(response.body);
  }
}
