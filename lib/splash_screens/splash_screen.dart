import 'package:eziline_project/splash_screens/splash_services.dart';
import 'package:eziline_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  splashServices splash_screen = splashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash_screen.isSignIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.png")
                )
            ),
          ),

          Center(
            child: Text("TECHNOLOGY\n      SCHOOL",style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),),
          ),
        ],
      ),
    );
  }
}
