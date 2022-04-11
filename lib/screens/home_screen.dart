import 'package:flutter/material.dart';
import 'package:swe_project/constants.dart';
import 'package:swe_project/widgets/book_rating.dart';
import 'package:swe_project/widgets/two_sided_round_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
              SizedBox(height: size.height * .1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RichText(text: TextSpan(
                  style: Theme.of(context).textTheme.headline5,
                  children: const [
                    TextSpan(text: "What are you \n reading"),
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
              //ReadingListCard()
            ],
          ),
      ),
      
    );
  }
}

class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double? rating;
  final Function? pressDetails;
  final Function? pressRead;
  const ReadingListCard({
    Key? key,
     required this.image, 
     required this.title, 
     required this.author, 
     this.rating, 
     this.pressDetails, 
     this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24,bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0,10),
                    blurRadius:33,
                    color: kShadowColor,
                  )
                ]
              ),
            ),
          ),
          Image.asset(
          image, 
          width: 150,
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
            children: <Widget>[
              IconButton(
                onPressed: (){},
                 icon: const Icon(
                   Icons.favorite_border,
                   )
                  ),
              const BookRating(score: 4.9)
            ],
          )
        ),
        Positioned(
          top: 160,
          child: Container(
            height: 85,
            width: 202,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                    style: TextStyle(color: kBlackColor),
                    children: [
                      TextSpan(
                        text: "title\n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: "author", 
                        style: TextStyle(
                          color: kLightBlackCOlor))
                        ],
                      )
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children:<Widget> [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 101,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: const Text("Details"),
                        ),
                      ),
                      const Expanded(
                        child: TwoSidedRoundButton(
                          text: "Read", 
                          radius: 24,
                          )
                    )
                    ],
                  )
              ],
            ),

        )
      )
      ],
      ),
    );
  }
}

