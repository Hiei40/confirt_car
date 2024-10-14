import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/LoginLayerCheck.dart';
import '../auth/sign_up.dart';
import '../doctor/cubit/cubit.dart';
import '../doctor/cubit/state.dart';
import '../main_screen/main_bage.dart';

class ClientBookingAcdimyScreen extends StatelessWidget {
  ClientBookingAcdimyScreen(
      {super.key,
        required this.IDDoctor,
        required this.clinic,
        required this.DoctorInfo,
        required this.ProfileInfo});

  final String IDDoctor;
  final String clinic;
  final Map DoctorInfo;
  final Map ProfileInfo;

  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation
  TextEditingController nameController = TextEditingController();
  TextEditingController BookingController = TextEditingController();
  TextEditingController major = TextEditingController();
  TextEditingController diploma = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit = DoctorCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MainAppBar(),
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
                            "احجز الان",
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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              buildRow("الاسم", "ادخل الاسم", nameController, "من فضلك ادخل الاسم"),
                              buildRow("رقم الهاتف", "رقم الهاتف", MobileController, "من فضلك ادخل رقم الهاتف"),
                              buildRow("التخصص", "التخصص", major, "من فضلك ادخل التخصص"),
                              buildRow("الدبلومه", "الدبلومه", diploma, "من فضلك ادخل الدبلومه"),
                              buildRow("المؤهل", "مؤهل", qualification, "من فضلك ادخل المؤهل"),
                              buildRow("ميعاد الدوره", "ميعاد الدوره", BookingController, "من فضلك ادخل ميعاد الدوره"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: BlocBuilder<DoctorCubit, MainDoctorState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () async{
                                if (_formKey.currentState!.validate()) {
                                  await    cubit.doctorsFetch(
                                      DoctorInfo["name"], clinic, IDDoctor, {
                                    "Date": DateTime.now(),
                                    "BookingDate": BookingController.text,
                                    "DoctorName": DoctorInfo["name"],
                                    "major":major.text,
                                    "diploma":diploma.text,
                                    "Name": nameController.text,
                                    "qualification":qualification.text,
                                    "Number": DoctorInfo["number"],
                                    "Phonenumber": MobileController.text
                                  });
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Reservation is done',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                );

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
                                  "الحجز",
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
    );
  }

  Widget buildRow(String labelText, String hintText, TextEditingController controller, String validationMsg) {
    return SizedBox(
      height: 75,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Text(
                labelText,
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
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return validationMsg;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
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
    );
  }
}
