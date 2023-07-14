import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eziline_project/screens/login_screen.dart';
import 'package:eziline_project/style/colors.dart';
import 'package:eziline_project/style/textstyle.dart';
import 'package:eziline_project/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../admin panel/screen/admin_login.dart';
class panel_selection extends StatefulWidget {
  const panel_selection({Key? key}) : super(key: key);

  @override
  State<panel_selection> createState() => _panel_selectionState();
}

class _panel_selectionState extends State<panel_selection> {


  //for carouselSlider
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "images/2.png",
    "images/4.png",
    "images/2.png",
    "images/4.png",


  ];

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 100,),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(seconds: 2),
                  viewportFraction: 1,
                  height: 250,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, carouselReason) {
                    print(index);
                    setState(() {
                      _current=index;
                    });
                  }
              ),
              items: imgList
                  .map((item) => Container(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                        ],
                      )),
                ),
              ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 40,
                  height: 3.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.APP_COLOR)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 70,),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Welcome',textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black54,
              )),
              WavyAnimatedText('Please Select Your Panel',textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              )),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                splashColor: AppColor.APP_COLOR,
                elevation: 5,
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>login_screen()));
                },
                height: 48,
                 child:isLoading?CircularProgressIndicator(
                color: Colors.white,
                ):Text("Student",style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )
                ),),
               minWidth: 100,
                shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.APP_COLOR,width: 2),
              borderRadius: BorderRadius.circular(12),
               ),
            color: Colors.white,
          ),
              MaterialButton(
                splashColor: AppColor.APP_COLOR,
                elevation: 5,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>admin_login()));
                },
                height: 48,
                child:isLoading?CircularProgressIndicator(
                  color: Colors.white,
                ):Text("Admin",style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )
                ),),
                minWidth: 100,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColor.APP_COLOR,width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
