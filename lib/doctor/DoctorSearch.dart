import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DoctorProfile.dart';
import '../auth/login_screen.dart';
import '../auth/sign_up.dart';
import '../main_screen/main_bage.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Doctorsearch extends StatelessWidget {
  const Doctorsearch({super.key, required this.Name, required this.Clinic});
final String Name;
final String Clinic;
  @override
  Widget build(BuildContext context) {
    TextEditingController Search=TextEditingController();
    DoctorCubit cubit=DoctorCubit.get(context);
    cubit.profile();
    cubit.SearchDoctors(Clinic,Name);
    return BlocBuilder<DoctorCubit,MainDoctorState>(
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color:const  Color.fromRGBO(0, 112, 205,1),
                    child: Row(children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const  MainPage(),
                              ));

                        },
                        child: Text("     comfort care",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),),
                      ),
                      SizedBox(width: 1000,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ));
                            },
                            child: Text("SignUp      ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white
                            ),),
                          ),InkWell(onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const  LoginScreen(),
                                ));
                          },
                            child: Text(cubit.profileMap["name"]!=null? "${cubit.profileMap["name"]}      "
                                : "Login      ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white
                            ),),
                          ),Text("Contact us",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white
                          ),),
                        ],),
                    ],),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Color.fromRGBO(236, 236, 236,1),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0,bottom: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("احجز مع أفضل دكاترة عيادات سلامتك الحديثة",style: TextStyle(
                                  color: Color.fromRGBO(111, 112, 114,1),
                                  fontSize: 20
                              ),),
                              SizedBox(height: 40,),
                              Text("احجز اونلاين او كلم ١٦٦٧٦",style: TextStyle(
                                color: Color.fromRGBO(111, 112, 114,1),
                              ),),
                              SizedBox(height: 40,),
                              Text("١٥٠٠٠ دكتور -٩٠٠٠ استاذ واستشاري - اكثر من ٤٠ تخصص",style: TextStyle(
                                color: Color.fromRGBO(111, 112, 114,1),
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(right: 350.0,top: 20),
                                child: SizedBox(width: 800,child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: 150,height: 60,
                                      padding: EdgeInsets.only(left: 40),
                                      child: Row(
                                        children: [
                                          Icon(Icons.search),
                                          Text("البحث"),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.red,
                                      ),),
                                    Container(
                                      width: 650,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child: TextField(
                                        controller: Search,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none, // Hide the default border
                                          ),
                                          filled: true,
                                          fillColor: Colors.white, // Same as the container color
                                        ),
                                      ),
                                    )

                                  ],
                                ),),
                              ),
                            ],
                          ),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 800,
                          height: 700,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListView.builder(
                              itemCount: cubit.DoctorSearch.length,
                              itemBuilder: (c,i){
                                return InkWell(
                                  onTap: (){

                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>  ProfileDoctor(IDDoctor:cubit.DocotorsId[i], clinic: Clinic, DoctorInfo: cubit.allDoctorList[i], title:""),
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 40.0,left: 20,right: 20),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(.5),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("${cubit.DoctorSearch[i]["name"]}",style: TextStyle(
                                                      color: Colors.blueAccent.shade700,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                  ),),
                                                  SizedBox(height: 20,),
                                                  Text("${cubit.DoctorSearch[i]["type"]}",style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12,
                                                  ),),
                                                  SizedBox(height: 20,),
                                                  Text("${cubit.DoctorSearch[i]["price"].toString()}:الكشف ",style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12,
                                                  ),),
                                                  SizedBox(height: 20,),
                                                  Text("الفروع :نسا و توليد",style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12,
                                                  ),),
                                                  SizedBox(height: 20,),
                                                  Text("الفروع :سلمتك",style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12,
                                                  ),)
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 100.0,left: 20),
                                                child: Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage(cubit.allDoctorList[i]["image"]==null?"https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40":cubit.allDoctorList[i]["image"]),
                                                          fit: BoxFit.cover
                                                      )
                                                  ),),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 227,
                    width: double.infinity,
                    color:const  Color.fromRGBO(0, 112, 205,1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 120,),
                        const  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Text("comfort care",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),),
                            SizedBox(height: 40,),
                            Text("About Us",style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),),
                            SizedBox(height: 20,),
                            Text("Contact Us",style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),),
                          ],
                        ),
                        SizedBox(width: 1000,),
                        Container(
                          height: 200,
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 1,child: Icon(Icons.facebook,color: Colors.white,)),
                                      Expanded(flex: 1,child: Icon(FontAwesomeIcons.instagram,
                                          color: Colors.white
                                      )),
                                      Expanded(flex: 1,child: Icon(FontAwesomeIcons.twitter,color: Colors.white)),

                                    ],
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}
