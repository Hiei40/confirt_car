import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/LoginLayerCheck.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';
import '../auth/login_screen.dart';
import '../auth/sign_up.dart';
import 'main_bage.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.AboutUs});
final String AboutUs;
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SingleChildScrollView(
            child: Column(children: [
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
                        },                      child: Text("SignUp      ",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                      ),),
                      ),InkWell(onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const  Layer_check(),
                            ));
                      },
                        child: Text("Login      ",style: TextStyle(
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
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/cover Image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Text(
                  "Better Healthcare for a Better Life",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20),
                child: Text(
                  "Book online or call 01050002288",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (1 / 30) * hieght,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  "Who We Are",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (1 / 30) * hieght,
          ),
          Container(
            child:  Text(
            AboutUs,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              height: 300,
              width: double.infinity,
              color: const Color.fromRGBO(0, 112, 205, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "comfort care",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "About Us",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 800,
                  ),
                  Container(
                    color: const Color.fromRGBO(0, 112, 205, 1),
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
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.instagram,
                                        color: Colors.white)),
                                Expanded(
                                    flex: 1,
                                    child: Icon(FontAwesomeIcons.twitter,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
      },
    ));
  }
}
