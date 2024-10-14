import 'package:beamer/beamer.dart';
import 'package:confirt_care/auth/login_screen.dart';
import 'package:flutter/material.dart';
import '../../auth/sign_up.dart';
import '../../main_screen/main_bage.dart';
class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 50,
        color:  Colors.white,
        alignment: Alignment.center,
        child: LayoutBuilder(
            builder: (context,constraints) {
              return constraints.maxWidth < 600? Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ));
                    },
                    child:  Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "image/comfert_care.png",
                              fit: BoxFit.cover,
                            )),
                        Text(" Comfort Care",style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800
                        ),)
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ):  Row(
              children: [
                SizedBox(width: 20,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ));
                  },
                  child:  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            "image/comfert_care.png",
                            fit: BoxFit.cover,
                          )),
                      Text(" Comfort Care",style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey.shade800
                      ),)
                    ],
                  ),
                ),
                Spacer(),
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
                            color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                      child: Text(
                        "Login      " ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        context.beamToNamed(
                            '/contact_us');
                      },
                      child: Text(
                        "Contact us      ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                    ),

                  ],
                ),
                InkWell(
                  onTap: (){
                    context.beamToNamed(
                        '/about_us');
                  },
                  child: Text(
                    "About Us",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),

              ],
            );
          }
        ),
      ),
    );
  }
}
