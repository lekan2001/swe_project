import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class youtubePlayer extends StatefulWidget {
  final String? youtubeURL;
  const youtubePlayer( {
     Key? key,
     this.youtubeURL
      }) : super(key: key);

  @override
  State<youtubePlayer> createState() => _youtubePlayerState();
}

class _youtubePlayerState extends State<youtubePlayer> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return const Scaffold(

    );
  }
}