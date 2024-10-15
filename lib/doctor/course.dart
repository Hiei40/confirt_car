import 'package:confirt_care/Const/AboutusConst.dart';
import 'package:confirt_care/doctor/course_booking.dart';
import 'package:confirt_care/doctor/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/LoginLayerCheck.dart';
import '../auth/sign_up.dart';
import '../main_screen/main_bage.dart';
import '../main_screen/widget/doctors_info.dart';
import 'ClientBookingScreen.dart';
import 'cubit/state.dart';

class CoursePage extends StatelessWidget {
  CoursePage(
      {
        super.key,
        required this.IDDoctor,
        required this.clinic,
        required this.DoctorInfo,
        required this.ProfileInfo, required  this.title
      });

  final String IDDoctor;
  final String clinic;
  final Map DoctorInfo;
  final Map ProfileInfo;
  final String title;
  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit=DoctorCubit.get(context);
    List bookingList=DoctorInfo["Booking date"];
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: const Color.fromRGBO(0, 112, 205, 1),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ));
                    },
                    child: Text(
                      "     comfort care",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 1000,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                        },
                        child: Text(
                          "SignUp      ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Layer_check(),
                          ));
                        },
                        child: Text(
                          "Login      ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Contact us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                height: 1200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text(DoctorInfo["name"],textDirection: TextDirection.ltr,),
                        subtitle: Text(Aboutusconst.BeatyAcamdemy),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              DoctorInfo["image"]==null?"https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40":DoctorInfo["image"]),
                        ),
                      ),
                    ),
                    Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.only(top: 40.0,left: 400),
                      child: Container(
                      ),
                    )),
                  ],
                ),
              ),
            ),
            BlocBuilder<DoctorCubit, MainDoctorState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  child: ListView.builder(
                  itemCount:bookingList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (c,i){
                      return Padding(
                        padding: const EdgeInsets.only(left: 40.0,right: 40.0,top: 20),
                        child: SizedBox(
                          width: 70,
                          height: 40,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>CouresBookingScreen(IDDoctor:IDDoctor, clinic:clinic, DoctorInfo: DoctorInfo, ProfileInfo: ProfileInfo,date: bookingList[i],)
                                // BookScreen(IDDoctor:IDDoctor, clinic:clinic, DoctorInfo: DoctorInfo, ProfileInfo: ProfileInfo["name"], ),
                              ));
                            },
                            child:Container(
                              width: 70,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.red,
                              ),
                              child: Text(bookingList[i], style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
