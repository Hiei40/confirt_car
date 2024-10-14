import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Const/AboutusConst.dart';
import '../doctor/cubit/cubit.dart';
import '../doctor/cubit/state.dart';
import 'acdimy_booking.dart';

class BeautyAcademy extends StatelessWidget {
  const BeautyAcademy({super.key});
  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit=DoctorCubit.get(context);
    cubit.allDoctors("bu_cdimy");
    return Scaffold(
      body:SizedBox(
        width: 1800,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainAppBar(),
                Container(
                  width: 900,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("image/bu.jpg"),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,bottom: 40.0),
                  child: Text(Aboutusconst.BeatyAcamdemy,
                  textDirection: TextDirection.rtl,
                  ),
                ),
              LayoutBuilder(
                  builder: (context,constraints) {
                    return Padding(
                    padding:  EdgeInsets.only(left:constraints.maxWidth < 600?  0.0:300),
                    child: SizedBox(
                      width: 900,
                      height: 100,
                      child: BlocBuilder<DoctorCubit,MainDoctorState>(
                        builder: (context,state) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                              itemCount:cubit.allDoctorList.length ,
                              itemBuilder: (c,i){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ClientBookingAcdimyScreen(
                                        IDDoctor: cubit.DocotorsId[i],
                                        clinic: "bu_cdimy",
                                        DoctorInfo: {},
                                        ProfileInfo: {},
                                      )
                                    // BookScreen(IDDoctor:IDDoctor, clinic:clinic, DoctorInfo: DoctorInfo, ProfileInfo: ProfileInfo["name"], ),
                                  ));
                                },
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: Text(cubit.allDoctorList[i]["name"],style: TextStyle(
                                    color: Colors.red
                                  ),),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red,
                                          width: .2
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            );
                          });
                        }
                      ),
                    ),
                  );
                }
              ),
              MainBottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
