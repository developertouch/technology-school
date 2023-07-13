import 'package:eziline_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  //for subject
  List<String> _subject= ['English','Urdu','Mathematics','Science',];
  String subjectSelectedValue='English';

  //for Session
  List<String> _session= ['2022/2023','2021/2022','2020/2021','2019/2020',];
  String sessionSelectedValue='2022/2023';

  //for Term
  List<String> _term= ['Ist term','2nd term',];
  String termSelectedValue='Ist term';

  //for Date
  DateTime _currentDate= DateTime.now();
  Future<void> getSelectedDate()async{
    final DateTime? selectedDate=await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(2002),
        lastDate: DateTime(2030)
    );
    if(selectedDate!=null && selectedDate!= _currentDate){
      setState(() {
        _currentDate=selectedDate;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.APP_COLOR,
        title: Text("DASHBOARD"),
        centerTitle: true,
      ),
      backgroundColor: AppColor.BG_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Subject :",style:GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      )
                    ) ,),
                    Spacer(),
                    DropdownButton(

                      elevation: 0,
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_forward_ios,size: 15,),
                       value: subjectSelectedValue,
                        items: _subject.map((e){
                          return DropdownMenuItem(
                              child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (newValue){
                         setState(() {
                    subjectSelectedValue=newValue.toString();

                      });
                      }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Session :",style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        )
                    ) ,),
                    Spacer(),
                    DropdownButton(
                        elevation: 0,
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_forward_ios,size: 15,),
                        value: sessionSelectedValue,
                        items: _session.map((e){
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (newValue){
                          setState(() {
                            sessionSelectedValue=newValue.toString();

                          });
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Term :",style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        )
                    ) ,),
                    Spacer(),
                    DropdownButton(
                        elevation: 0,
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_forward_ios,size: 15,),
                        value: termSelectedValue,
                        items: _term.map((e){
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (newValue){
                          setState(() {
                            termSelectedValue=newValue.toString();

                          });
                        }),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Date :",style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        )
                    ) ,),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        getSelectedDate();
                      },
                      child: Text("${_currentDate.year}/${_currentDate.month}/${_currentDate.day}"),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Divider(
                  height: 1,
                  thickness: 2,
                  color: Colors.black26,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Student",style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        )
                    ) ,),
                    Spacer(),
                    Text("Scores",style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        )
                    ) ,),

                  ],
                ),

              ],
            ),
          ),

          ListTile(
            minVerticalPadding: 10,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/5.png"),
              radius: 40,
              backgroundColor: AppColor.APP_COLOR,
            ),
            title: Text("Ali khan"),
            subtitle: Text("Reg/8349"),
            trailing: Text("90%"),
          ),
          ListTile(
            minVerticalPadding: 10,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/6.png"),
              radius: 40,
              backgroundColor: AppColor.APP_COLOR,
            ),
            title: Text("shumila"),
            subtitle: Text("Reg/3493"),
            trailing: Text("75%"),
          ),
          ListTile(
            minVerticalPadding: 10,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/7.png"),
              radius: 40,
              backgroundColor: AppColor.APP_COLOR,
            ),
            title: Text("Ihtesham"),
            subtitle: Text("Reg/2383"),
            trailing: Text("83%"),
          ),
          ListTile(
            minVerticalPadding: 10,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/8.png"),
              radius: 40,
              backgroundColor: AppColor.APP_COLOR,
            ),
            title: Text("khawaja"),
            subtitle: Text("Reg/9383"),
            trailing: Text("53%"),
          ),
          ListTile(
            minVerticalPadding: 10,
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/9.png"),
              radius: 40,
              backgroundColor: AppColor.APP_COLOR,
            ),
            title: Text("Zinab khan"),
            subtitle: Text("Reg/3943"),
            trailing: Text("48%"),
          ),

        ],
      ),
    );
  }
}
