import 'dart:io';

import 'package:eziline_project/screens/login_screen.dart';
import 'package:eziline_project/screens/view_detail_screen.dart';
import 'package:eziline_project/style/colors.dart';
import 'package:eziline_project/style/textstyle.dart';
import 'package:eziline_project/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {


  //for buttons

  bool isPresentButtonDisabled = false;
  bool isLeaveButtonDisabled = false;
  bool isViewButtonDisabled = false;

  void _disableButton(String button) {
    setState(() {
      switch (button) {
        case 'Present':
          isPresentButtonDisabled = true;
          break;
        case 'Leave':
          isLeaveButtonDisabled = true;
          break;
        case 'View':
          isViewButtonDisabled = true;
          break;
      }
    });

    Future.delayed(Duration(hours: 24), () {
      setState(() {
        switch (button) {
          case 'Present':
            isPresentButtonDisabled = false;
            break;
          case 'Leave':
            isLeaveButtonDisabled = false;
            break;
          case 'View':
            isViewButtonDisabled = false;
            break;
        }
      });
    });
  }

  //end here

  bool ispressed4=false;

  //for logout and quickalert at appbar
  void showAlert(QuickAlertType quickAlertType){
    QuickAlert.show(
      width: 100,

      showCancelBtn: true,
      text: 'Do you want to logout',
      context: context, type:
    QuickAlertType.confirm,
      onConfirmBtnTap: () async{
        var _auth=await FirebaseAuth.instance;
        try{
          await _auth.signOut();
          Fluttertoast.showToast(msg: "you are now logout so login again");
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>login_screen()));

        }catch(e){
          print(e.toString());

        }
      },
      onCancelBtnTap: (){
        Navigator.of(context).pop();
      },
      confirmBtnColor: AppColor.APP_COLOR,
    );

  }
  //end here

  final ref = FirebaseDatabase.instance.ref('post');

  File? _selectedImage;
  getImage()async{
    ImagePicker _picker=ImagePicker();
    XFile? newImage=await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage=File(newImage!.path);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      appBar: AppBar(
        backgroundColor: AppColor.APP_COLOR,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("attendance screen"),
            IconButton(onPressed: () async{
              showAlert(QuickAlertType.confirm);
            }, icon:Icon(Icons.logout_rounded)),

          ],
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _selectedImage == null?CircleAvatar(

                radius: 50,
                backgroundColor:AppColor.APP_COLOR,
                child: IconButton(onPressed: (){
                  getImage();
                }, icon:Icon(Icons.person,color: Colors.black,size: 35,))
              ):CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(File(_selectedImage!.path)),),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: IconButton(onPressed: ()async{
                  setState(() {
                    ispressed4=!ispressed4;
                  });
                  FirebaseStorage fs= FirebaseStorage.instance;
                  Reference ref= await fs.ref().child(DateTime.now().millisecondsSinceEpoch.toString());
                   await ref.putFile(File(_selectedImage!.path));
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your image has been saved")));
                   },
                 icon: Icon(Icons.done,size: 35,color: ispressed4?Colors.green:Colors.grey)),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            color: AppColor.BG_COLOR,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index){
                    return Row(
                      children: [
                        Text("Student Name :",style: GoogleFonts.poppins(
                            textStyle: AppTextStyles.HEADING_TEXT
                        ),),
                        Text(snapshot.child('name').value.toString()),
                      ],
                    );
                  }
              ),
            ),
          ),
          SizedBox(height: 10,),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff8ecae6),width: 2.0),
                  borderRadius: BorderRadius.circular(12),

                ),
                disabledColor: Colors.green,
                color: isPresentButtonDisabled?Colors.green:Colors.white,
                onPressed: isPresentButtonDisabled
                    ? null
                    : () => _disableButton('Present'),
                child: Text('Present',style: GoogleFonts.poppins(
                  textStyle: AppTextStyles.HEADING_TEXT,
                ),),
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff8ecae6),width: 2.0),
                  borderRadius: BorderRadius.circular(12),

                ),
                disabledColor: Colors.red,
                color: isLeaveButtonDisabled?Colors.red:Colors.white,
                onPressed:
                isLeaveButtonDisabled ? null : () => _disableButton('Leave'),
                child: Text('Leave',style: GoogleFonts.poppins(
                  textStyle: AppTextStyles.HEADING_TEXT,
                ),),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>view_detail()));
                },
                child: MaterialButton(

                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff8ecae6),width: 2.0),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  disabledColor: Colors.yellow,
                  color: isViewButtonDisabled?Colors.yellow:Colors.white,
                  onPressed:
                  isViewButtonDisabled ? null : () => _disableButton('View'),
                  child: Text('View',style: GoogleFonts.poppins(
                    textStyle: AppTextStyles.HEADING_TEXT,
                  ),),
                ),
              ),

            ],
          )

        ],
      )
    );
  }
}
