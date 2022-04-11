import 'package:flutter/material.dart';
import 'package:swe_project/constants.dart';
import 'package:swe_project/screens/home_screen.dart';
import 'package:swe_project/widgets/rounded_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          displayColor: kBlackColor
        )
      ),
      home: const WelcomePage(),
    );
  }
}


class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Bitmap.png"),
          fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline6,
              children: const [
                TextSpan(
                  text: "WEL",
                ),
                TextSpan(
                  text: "COME.",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
                fontSize: 20,
              ),
            )
          ],
        )
        ,
      ),
      
    );
  }
}