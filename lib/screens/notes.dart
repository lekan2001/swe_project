import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:swe_project/widgets/rounded_button.dart';

class notes extends StatelessWidget {
  const notes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink[50],
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
                  print(path);
                  print(fileName);
                },
                ),
            ),
          )
        ],
      ),
      
    );
  }
}