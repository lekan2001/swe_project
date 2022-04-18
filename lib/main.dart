import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swe_project/constants.dart';
import 'package:swe_project/provider/google_sign_in.dart';
import 'package:swe_project/screens/home_screen.dart';
import 'package:swe_project/widgets/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
            displayColor: kBlackColor
          )
        ),
        home: const WelcomePage(),
      ),
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
            ),
            //Spacer(),
            ElevatedButton.icon(
              onPressed: (){
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              }, 
            label:const Text("Sign Up with Google"),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: const Size(200, 50)
            ),
             icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            ),
          ],
        )
        ,
      ),
      
    );
  }
}