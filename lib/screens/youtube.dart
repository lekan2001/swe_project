import 'package:flutter/material.dart';

class youtube extends StatelessWidget {
  const youtube({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.white,
      ),
      
    );
  }
}