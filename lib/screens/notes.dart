

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:swe_project/services/storage_service.dart';
import 'package:swe_project/widgets/rounded_button.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class notes extends StatelessWidget {
  const notes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    //storage.listFiles();
    return Scaffold(

      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.pink[50],
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Column(
        children:[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RoundedButton(
                text: "Upload",
                color: Colors.black12,
                press: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg', 'heic'],
                  );
                  if (results == null){
                    ScaffoldMessenger
                        .of(context)
                        .showSnackBar(
                        const SnackBar(
                            content: Text(
                                'No file selected.'
                            )
                        )
                    );
                    return null;
                  }
                  final path = results.files.single.path!;
                  final fileName = results.files.single.name;
                  storage.uploadFile(path, fileName)
                      .then((value) =>
                      print("Done"));
                  print(path);
                  print(fileName);
                },
                ),
            ),
          ),
          FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot){
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                return Container(
                  //padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(left:20, right: 20),
                        //child : Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //return children: [
                            child: RoundedButton(
                              btnWidth: 160,
                              press: (){},
                              text: (snapshot.data!.items[index].name),
                              color: Colors.black12,

                            ),
                          //],
                        //),
                      );
                    },
                    itemCount: snapshot.data!.items.length,
                  ),
                );
              } if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                return const CircularProgressIndicator();
              }
              return Container();
            },
            future: storage.listFiles(),
          ),
          FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                return Container(
                  width: 300,
                  height: 250,
                  child: Image.network(snapshot.data!,fit: BoxFit.cover, ),
                ) ;

              } if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                return const CircularProgressIndicator();
              }
              return Container();
            },
            future: storage.downloadURL('test.jpg'),
          )
        ],
      ),

    );
  }
}