
import 'package:eziline_project/screens/home_Screen.dart';
import 'package:eziline_project/screens/registration_screen.dart';
import 'package:eziline_project/style/colors.dart';
import 'package:eziline_project/widgets/button.dart';
import 'package:eziline_project/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  GlobalKey<FormState> _key=GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.BG_COLOR,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: AppColor.APP_COLOR,
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Text("Student Login",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )
              ),),
              SizedBox(height: 15,),


                 textfield(
                 title: 'Enter your email',
                 Controller: _emailController,
               ),
              SizedBox(height: 15,),
              passwordfield(
                Controller: _passwordController,
              ),
              SizedBox(height: 50,),
              button(
                title: 'login',
                btnColor: AppColor.APP_COLOR,
                onPressed: ()async{
                  var _auth= await FirebaseAuth.instance;
                  if(_key.currentState!.validate()){
                    try{
                      await _auth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>home_screen()));

                    }catch(e){

                    }
                  }else{
                    print("error");
                  }

                },
                width: 300,
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000).withOpacity(0.5),
                      )
                  ),),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>registration_screen()));
                    },
                    child: Text("sign up",style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColor.APP_COLOR,
                        )
                    ),),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}
