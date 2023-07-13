
import 'package:eziline_project/screens/login_screen.dart';
import 'package:eziline_project/style/colors.dart';
import 'package:eziline_project/widgets/button.dart';
import 'package:eziline_project/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registration_screen extends StatefulWidget {
  const registration_screen({Key? key}) : super(key: key);

  @override
  State<registration_screen> createState() => _registration_screenState();
}

class _registration_screenState extends State<registration_screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> _key=GlobalKey();
  var _auth= FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref('post');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      appBar: AppBar(
        backgroundColor: AppColor.APP_COLOR,
        title: Text("Registration"),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/2.png")
                    )
                ),
              ),
              textfield(
                title: 'Enter your name',
                Controller: _nameController,
              ),
              SizedBox(height: 15,),
              textfield(
                Controller: _emailController,
                title: ' Enter your email',
              ),
              SizedBox(height: 15,),
              passwordfield(
                Controller: _passwordController,
              ),
              SizedBox(height: 50,),
              button(
                title: 'Register',
                width: 300,
                btnColor: AppColor.APP_COLOR,
                onPressed: ()async{
                  if(_key.currentState!.validate()){

                    try{
                      await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                      databaseRef.child( DateTime.now().millisecondsSinceEpoch.toString()).set({
                        'name': _nameController.text.toString(),
                        'id': DateTime.now().millisecondsSinceEpoch.toString(),
                        

                      }).then((value){

                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>login_screen()));
                    }catch(e){

                    }
                  } else{
                    print("error");
                  }


                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?",style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000).withOpacity(0.5),
                      )
                  ),),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>login_screen()));
                    },
                    child: Text("Sign in",style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColor.APP_COLOR
                        )
                    ),),
                  ),
                ],
              ),

            ],
          ),
        ),
      )
    );
  }
}
