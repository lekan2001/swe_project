import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swe_project/screens/home_screen.dart';
import 'package:swe_project/screens/notes.dart';
import 'package:swe_project/screens/youtube.dart';

class navigation_bar extends StatelessWidget {
  const navigation_bar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      backgroundColor: Colors.pink[50],
      activeColor: Colors.black12,
      inactiveColor: Colors.white,
      onTap: (index){},
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Notes'
        ),
      ],

    ),
    tabBuilder: (context,index){
      switch (index){
        case 0 :
        return const HomeScreen();
        case 1:
        default:
          return const notes();
      }
    }

  );
}