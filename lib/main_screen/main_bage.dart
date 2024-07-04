import 'package:confirt_care/main_screen/Contactus.dart';
import 'package:confirt_care/main_screen/about_us_screen.dart';
import 'package:confirt_care/main_screen/widget/AboutUsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Const/AboutusConst.dart';
import '../Const/Class PhotoClinics.dart';
import '../auth/LoginLayerCheck.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';
import '../auth/login_screen.dart';
import '../auth/sign_up.dart';
import '../doctor/all_doctors.dart';
import 'widget/clinic_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    List Photo=[photoClinics.salamtak,photoClinics.ComfortCare,photoClinics.BeautyAcademy,photoClinics.BeautyClinicAcademy];
    List aboutUS=[Aboutusconst.salamtakAbout,Aboutusconst.ComfortCare,Aboutusconst.BeatyAcamdemy,Aboutusconst.BeatyAcamdemy];
    List Name=["Salamtak","ComfortCare","Beauty Academy","Beauty clinic academy"];
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(children: [
            //main
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
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 800,
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
              height: 200,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Photo.length,
              itemBuilder: (BuildContext context, int index) {
                return Aboutuscontainer(ImageNetwork: Photo[index], Name: Name[index], AboutClinic: aboutUS[index],onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  AboutUsScreen(AboutUs: aboutUS[index],),
                  ));

                },);
              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(
              height: 40,
            ); },
            ),
            SizedBox(
              height: 40,
            ),
            width > 1200
                ? Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      child: ClinicCard(image: photoClinics.salamtak, name: "Salamtak"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AllDoctors(Clinic:'slmtk' ),
                        ));
                      },
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      child: ClinicCard(image:  photoClinics.ComfortCare, name: "Comfort Care Group"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AllDoctors(Clinic:'comfrt_care' ),
                        ));
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AllDoctors(Clinic: 'bu_cdimy'),
                          ));
                        },

                        child: ClinicCard(image:  photoClinics.BeautyAcademy, name: "Beauty Academy")),
                    const SizedBox(width: 20),
                    InkWell(child: ClinicCard(image:  photoClinics.BeautyClinicAcademy, name: "Beauty Clinic Academy"),
                        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AllDoctors(Clinic: 'Beautyclinicacademy'),
        ));
        },


                    ),
                    const Spacer(),
                  ],
                ),
              ],
            )
                : ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: ClinicCard(image: photoClinics.salamtak, name: "Salamtak"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllDoctors(Clinic: 'slmtk'),
                    ));
                  },
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: ClinicCard(image: photoClinics.ComfortCare, name: "Comfort Care Group"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllDoctors(Clinic: 'comfrt_care'),
                    ));
                  },
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: ClinicCard(image: photoClinics.BeautyAcademy, name: "Beauty Academy"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllDoctors(Clinic: 'bu_cdimy'),
                    ));
                  },
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: ClinicCard(image: photoClinics.BeautyClinicAcademy, name: "Beauty Clinic Academy"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllDoctors(Clinic: 'Beautyclinicacademy'),
                    ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 227,
              width: double.infinity,
              color: const Color.fromRGBO(0, 112, 205, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  AboutUsScreen(AboutUs: Aboutusconst.ComfortCare,),
                          ));
                        },
                        child: Text(
                          "About Us",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Contactus(),
                          ));
                        },
                        child: Text(
                          "Contact Us",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
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
          ]),
        ),
      );
    });
  }
}
