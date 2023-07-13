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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.png")
                )
            ),
          ),
          SizedBox(height: 50,),
          Text("Welcome to Technology school\n         please select your panel",style: GoogleFonts.poppins(
            textStyle: AppTextStyles.HEADING_TEXT,
          ),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                title: 'Student',
                btnColor: AppColor.APP_COLOR,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>login_screen()));
                },
                width: 100,
              ),
              button(
                title: 'Admin',
                btnColor: AppColor.APP_COLOR,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>admin_login()));
                },
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
