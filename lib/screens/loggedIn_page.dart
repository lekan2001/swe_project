import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swe_project/constants.dart';
import 'package:swe_project/main.dart';
import 'package:swe_project/provider/google_sign_in.dart';
import 'package:swe_project/screens/details_screen.dart';
import 'package:swe_project/screens/details_screen_one.dart';
import 'package:swe_project/screens/home_screen.dart';
import 'package:swe_project/widgets/reading_card_list.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:iconsax/iconsax.dart';
class LoggedInPage extends StatefulWidget {
  const LoggedInPage({ Key? key }) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleProfileButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    var user_name = user.displayName;
    var user_email = user.email;
     return  AdvancedDrawer(
       backdropColor: Colors.pink[50],
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            disabledGestures: false,
            childDecoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade900,
                  blurRadius: 20.0,
                  spreadRadius: 5.0,
                  offset: Offset(-20.0, 0.0),
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            // shows the drawer that's displayed when account icon is tapped
            drawer: drawer(),
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.pink[50],
           elevation: 0,
           foregroundColor: Colors.black,
           leading: IconButton(
             onPressed: _handleProfileButtonPressed,
              icon: Icon(Iconsax.profile_2user)
              ),
         ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/main_page_bg.png"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //SizedBox(height: size.height * .1,),
                        //Center(
                          Padding(
                              padding: const EdgeInsets.only(top: 10, left: 24),
                                      child: Text("Hi, $user_name !", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    ),
                        //),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: RichText(text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: const [
                              TextSpan(text: "What are you \n reading "),
                              TextSpan(
                                text: "today?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                              )
                            ]
                          )
                        ),
                      ),
                      const SizedBox(height: 30),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailsScreen();
                                                  },
                                                ),
                                              );
                                },
                                child: ReadingListCard(
                                 image: "assets/images/book-1.png",
                                            title: "Crushing & Influence",
                                            auth: "Gary Venchuk",
                                            rating: 4.9,
                                            pressDetails: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailsScreen();
                                                  },
                                                ),
                                              );
                                            },
                                            pressRead: () {},
                                ),
                              ),
                              ReadingListCard(
                               image: "assets/images/book-2.png",
                                          title: "Top Ten Business Hacks",
                                          auth: "Herman Joel",
                                          rating: 4.8,
                                          pressDetails: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsScreenOne();
                                                },
                                              ),
                                            );
                                          },
                                          pressRead: () {},
                              ),
                              ReadingListCard(
                               image: "assets/images/book-3.png",
                                          title: "How to win & influ...",
                                          auth: "Gary Venchuk",
                                          rating: 4.8,
                                          pressDetails: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsScreen();
                                                },
                                              ),
                                            );
                                          },
                                          pressRead: () {},
                              ),
                              
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.headline4,
                                    children: const [
                                      TextSpan(text: "Best of the "), 
                                      TextSpan(
                                        text: "day",
                                        style: TextStyle(fontWeight: FontWeight.bold)
                                      )
                                    ]
                                  )
                                ),
                                bestOfTheDayCard(size,context),
                                RichText(
                                    text: TextSpan(
                                      style: Theme.of(context).textTheme.headline5,
                                      children: const [
                                        TextSpan(text: "Continue "),
                                        TextSpan(
                                          text: "reading...",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(38.5),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 10),
                                          blurRadius: 33,
                                          color: const Color(0xFFD3D3D3).withOpacity(.84),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(38.5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding:  const EdgeInsets.only(
                                                left: 30,
                                                right: 20
                                              ),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                       MainAxisAlignment.end,
                                                      crossAxisAlignment: 
                                                      CrossAxisAlignment.start,
                                                      children: const <Widget>[
                                                        Text("Crushing & Influence", 
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                        Text("Gary Venchuck", style: TextStyle(
                                                          color: kLightBlackCOlor,
                                                        ),),
                                                        Align(
                                                          alignment: Alignment.bottomRight,
                                                          child: Text("Chapter 7 of 10", 
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: kLightBlackCOlor,
                                                          ),),
                                                        ),
                                                        SizedBox(height: 5,)
                                                      ],
                                                    ),
                                                  ),
                                                  Image.asset("assets/images/book-1.png",
                                                  width: 55,)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 7,
                                            width: size.width * .65,
                                            decoration: BoxDecoration(
                                              color: kProgressIndicator,
                                              borderRadius: BorderRadius.circular(7)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40,),
       
                            ],
                          ),
                        
                        ),
                        
                      ],
                    ),
                ),
              ],
            ),
          ),
          
        ),
     );
  }
  drawer() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 80.00,
                  height: 80.00,
                  margin: EdgeInsets.only(left: 20, top: 24.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/book-1.png')),
              SizedBox(height: 10),
              Spacer(),
              Divider(
                color: Colors.grey.shade800,
              ),
              ListTile(
                onTap: () {
                  
                },
                leading: Icon(Iconsax.profile_2user, color: Colors.black,),
                title: Text('Profile', style: TextStyle(color: Colors.black),),
              ),
              ListTile(
                onTap: () {
                 // Navigator.pushNamed(context, SECURITY_ROUTE);
                },
                leading: Icon(Iconsax.security, color: Colors.black,),
                title: Text('Security',style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                onTap: () {
                  //Navigator.pushNamed(context, NOTIFICATION_ROUTE);
                },
                leading: Icon(Iconsax.notification, color: Colors.black,),
                title: Text('Notification', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 50),
              Divider(color: Colors.grey.shade800),
              ListTile(
                onTap: () {
                 // Navigator.pushNamed(context, ABOUT_US_ROUTE);
                },
                leading: Icon(Iconsax.info_circle, color: Colors.black,),
                title: Text('About us' ,style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                onTap: () {
                 // Navigator.pushNamed(context, SUPPORT_ROUTE);
                },
                leading: Icon(Iconsax.support, color: Colors.black,),
                title: Text('Support' ,style: TextStyle(color: Colors.black)),
              ),
              Spacer(),
              ListTile(
                onTap: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleSignOut();
                Navigator.push(context, MaterialPageRoute(
                                                builder: (context) {
                                                  return WelcomePage();
                                                },
                                              ),);
                 // BlocProvider.of<HomeCubit>(context).signOut();
                  //Navigator.pushNamed(context, SIGN_IN_ROUTE);
                },
                leading: Icon(Iconsax.logout, color: Colors.black,),
                title: Text('Sign out', style: TextStyle(color: Colors.black)),

              ),
            ],
          ),
        ),
      ),
    );
  }

  appBar() {
    return SliverAppBar(
      expandedHeight: 250.0,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.black,
        onPressed: _handleProfileButtonPressed,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: _advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: Icon(
                value.visible ? Iconsax.close_square : Iconsax.profile_circle,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      ));
    }
}