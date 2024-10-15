import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/LoginLayerCheck.dart';
import '../auth/sign_up.dart';
import '../main_screen/main_bage.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class ClientBookingScreen extends StatelessWidget {
    ClientBookingScreen(
      {super.key,
        required this.IDDoctor,
        required this.clinic,
        required this.DoctorInfo,
        required this.date,
      });

  final String IDDoctor;
  final String clinic;
  final Map DoctorInfo;
  final String date;

  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation
  TextEditingController nameController = TextEditingController();
  TextEditingController BookingController = TextEditingController();
  TextEditingController MobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit = DoctorCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: Text(
                      "     كومفرت كير",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "تسجيل      ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Layer_check(),
                            ),
                          );
                        },
                        child: Text(
                          "تسجيل دخول      ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "تواصل معنا",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 20, bottom: 20),
              child: Container(
                height: 600,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "احجز الآن",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 75,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                  flex: 3,
                                  child: Text(
                                    "الاسم",
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    width: 380,
                                    child: TextFormField(
                                      controller: nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال الاسم';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "الاسم",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                  flex: 3,
                                  child: Text(
                                    "الهاتف",
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    width: 380,
                                    child: TextFormField(
                                      controller: MobileController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'يرجى إدخال رقم الهاتف';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "رقم الهاتف",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                 Expanded(
                                  flex: 3,
                                  child:date==""? Text(""): Text(
                                    "وقت الحجز",
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    width: 380,
                                    child:date==""? Text(""):Text(date),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: BlocBuilder<DoctorCubit, MainDoctorState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await cubit.doctorsFetch(
                                    DoctorInfo["name"], clinic, IDDoctor, {
                                  "Date": DateTime.now(),
                                  "BookingDate": BookingController.text,
                                  "DoctorName": DoctorInfo["name"],
                                  "Name": nameController.text,
                                  "Number": DoctorInfo["number"],
                                  "Phonenumber": MobileController.text,
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'تم الحجز بنجاح',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.red,
                              ),
                              child: Text(
                                "احجز",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),
        ),
      ),
    ),
    );
  }
}
