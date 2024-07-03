import 'package:confirt_care/doctor/ClientBookingScreen.dart';
import 'package:confirt_care/doctor/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/LoginLayerCheck.dart';
import '../auth/sign_up.dart';
import 'cubit/cubit.dart';
import '../main_screen/main_bage.dart';

class ProfileDoctor extends StatelessWidget {
  ProfileDoctor(
      {super.key, required this.IDDoctor, required this.clinic, required this.DoctorInfo, required this.ProfileInfo});

  final String IDDoctor;
  final String clinic;
  final Map DoctorInfo;
  final Map ProfileInfo;

  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit=DoctorCubit.get(context);
    return Scaffold(

      body: Column(
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
          Container(
            height: 230,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
            color: Colors.white,
            child: ListTile(
              title: Text(DoctorInfo["name"]),
              subtitle: Text(DoctorInfo["pio"]),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    DoctorInfo["image"]==null?"https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40":DoctorInfo["image"]),
              ),
            ),
          ),
          BlocBuilder<DoctorCubit, MainDoctorState>(

            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>ClientBookingScreen(IDDoctor:IDDoctor, clinic:clinic, DoctorInfo: DoctorInfo, ProfileInfo: ProfileInfo,)
                            // BookScreen(IDDoctor:IDDoctor, clinic:clinic, DoctorInfo: DoctorInfo, ProfileInfo: ProfileInfo["name"], ),
                      ));



                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red,
                      ),
                      child: Text("Book Now", style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
