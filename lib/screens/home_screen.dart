import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swe_project/constants.dart';
import 'package:swe_project/screens/details_screen.dart';
import 'package:swe_project/screens/details_screen_one.dart';
import 'package:swe_project/screens/loggedIn_page.dart';
import 'package:swe_project/widgets/book_rating.dart';
import 'package:swe_project/widgets/reading_card_list.dart';
import 'package:swe_project/widgets/two_sided_round_button.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    var user_name = user.displayName;
    var user_email = user.email;

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber
            ));
        } else if (snapshot.hasError){
          return const Center(
            child: Text('Something Went Wrong!'));
        } else if(snapshot.hasData){
          return const LoggedInPage();
        }
        else {
          return Container(
            child: const Center(
              child: Text('Please Sign In')),
          );
            }
      },
     // child:
    );
  }
}
Container bestOfTheDayCard(Size size, BuildContext context) {
  String launchURL = 'https://www.youtube.com';
  Future<void> _launchInBrowser(String url) async{
    // ignore: deprecated_member_use
    if (await canLaunch(url)){
      // ignore: deprecated_member_use
      await launch(
          url,
          forceSafariVC: true,
          forceWebView: true,
          headers: <String, String>{
            'header_key' : 'header_value'
          }
      );

    } else{
      throw 'Could not launch $url';
    }
  }


  return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .35,
              ),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: const Text(
                      "New York Time Best For 11th March 2020",
                      style: TextStyle(
                        fontSize: 9,
                        color: kLightBlackCOlor,
                      ),
                    ),
                  ),
                  Text(
                    "How To Win \nFriends &  Influence",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Text(
                    "Gary Venchuk",
                    style: TextStyle(color: kLightBlackCOlor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0), 
                          child: BookRating(score: 4.9),
                        ),
                        Expanded(
                          child: Text(
                            "When the earth was flat and everyone wanted to win the game of the best and people….",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: kLightBlackCOlor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/book-3.png",
              width: size.width * .37,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSidedRoundButton(
                text: "Watch",
                radius: 24,
                press: () {
                  _launchInBrowser(launchURL);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

