import 'package:eziline_project/style/colors.dart';
import 'package:flutter/material.dart';
class view_detail extends StatefulWidget {
  const view_detail({Key? key}) : super(key: key);

  @override
  State<view_detail> createState() => _view_detailState();
}

class _view_detailState extends State<view_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.APP_COLOR,
        title: Text("detail screen"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
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
            child: Text("Right now we don't have any data"),
          ),
        ],
      ),
    );
  }
}
