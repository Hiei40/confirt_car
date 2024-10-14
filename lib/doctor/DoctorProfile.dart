import 'package:confirt_care/doctor/ClientBookingScreen.dart';
import 'package:confirt_care/doctor/cubit/state.dart';
import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Const/AboutusConst.dart';
import 'cubit/cubit.dart';
class ProfileDoctor extends StatelessWidget {
  ProfileDoctor(
      {super.key,
      required this.IDDoctor,
      required this.clinic,
      required this.DoctorInfo,
        required this.title});
  final String IDDoctor;
  final String clinic;
  final Map DoctorInfo;
  final String title;
  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit = DoctorCubit.get(context);
    double screenWidth = MediaQuery.of(context).size.width;
    cubit.doctorData(clinic, IDDoctor);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainAppBar(),
            LayoutBuilder(
                builder: (context,constraints) {
                  return constraints.maxWidth < 600?
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child:SizedBox(
                      height: 800,
                      width: 320,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 00.0,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 320,
                                        padding: EdgeInsets.only(left: 20,),
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
                                        height:clinic=="bu_cdimy"? 1200:200,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            // مسافة بين الصورة والنصوص
                                            Padding(
                                              padding: const EdgeInsets.only(top: 80.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        DoctorInfo["name"],
                                                        style: TextStyle(fontWeight: FontWeight.bold,
                                                          color: Colors.grey.shade600,
                                                          fontSize: 20,
                                                        ),
                                                        textDirection: TextDirection.rtl,
                                                      ),
                                                      SizedBox(height: 5), // مسافة بين النصوص
                                                      clinic=="bu_cdimy"?  SizedBox(
                                                        height:clinic=="bu_cdimy"? 1200:200,
                                                        child: Text(
                                                          clinic == "bu_cdimy"
                                                              ? Aboutusconst.BeatyAcamdemy
                                                              : DoctorInfo["pio"],
                                                          style: TextStyle(
                                                              color: Colors.grey.shade400,
                                                              fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                      ): SizedBox(
                                                        width: 180,
                                                        child: Text(
                                                          clinic == "bu_cdimy"
                                                              ? Aboutusconst.BeatyAcamdemy
                                                              : DoctorInfo["pio"],
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color: Colors.grey.shade400,
                                                              fontSize: 16
                                                          ),
                                                          textDirection: TextDirection.rtl,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 40.0,),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          DoctorInfo["image"] == null
                                                              ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                                              : DoctorInfo["image"],
                                                        ),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0,),
                                    child: Container(
                                      width: 320,
                                      height: 150,
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(width: 190,),
                                              Text("  عن الدكتور",textDirection: TextDirection.rtl,style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade600,
                                                  fontSize: 20
                                              ),
                                              ),
                                              Icon(Icons.info_outline,color: Color.fromRGBO(0, 112, 205, 1.0),),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: Text(DoctorInfo["pio"],style:  TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600,
                                                fontSize: 12
                                            ),textDirection: TextDirection.rtl,),
                                          ),
                                          SizedBox(height: 20,),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors .grey.withOpacity(.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(flex:1,child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Container(
                              height: 800,
                              width: 310,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Text("معلومات الحجز",textDirection: TextDirection.rtl,),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                      ),
                                      color: const Color.fromRGBO(0, 112, 205, 1),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("احجـــز",style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600
                                  ),),
                                  Text("كشف طبي",style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18
                                  ),),
                                  Text('  500 جنيه',textDirection: TextDirection.rtl,),
                                  SizedBox(height: 10,child: Divider(
                                    height: 1,
                                  ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(width: 80,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Column(
                                          children: [
                                            Container(),
                                            Text(title),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                DoctorInfo["image"] == null
                                                    ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                                    : DoctorInfo["image"],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,child: Divider(
                                    height: 1,
                                  )),

                                  Text("اخـتــــــــار ميعاد الــحــجــز",style: TextStyle(
                                      fontSize: 18
                                  ),),
                                  SizedBox(height: 10,),
                                  BlocBuilder<DoctorCubit, MainDoctorState>(
                                      builder: (context, state) {
                                        return cubit.days.isEmpty  ? Text("لا توجد مواعيد") : Container(
                                          height:clinic=="bu_cdimy"? 1200:200,
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            itemCount: cubit.days.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (c, i) {
                                              return InkWell(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        ClientBookingScreen(
                                                          IDDoctor: IDDoctor,
                                                          clinic: clinic,
                                                          DoctorInfo: cubit.profileMap,
                                                          date:"",
                                                        ),
                                                  ));

                                                },
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          cubit.days[i],
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        alignment: Alignment.center,
                                                        width: 75,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(8),
                                                            topLeft: Radius.circular(8),
                                                          ),
                                                          color: const Color.fromRGBO(0, 112, 205, 1),
                                                        ),
                                                      ),
                                                      Container(
                                                        width:75,
                                                        height: 100,
                                                        alignment: Alignment.center,
                                                        padding: EdgeInsets.only(left: 5,right: 5),
                                                        child: Text(cubit.dateTimes[i],textAlign: TextAlign.center,),),
                                                      Container(
                                                        child: Text(
                                                          "احجز الان",
                                                          style: TextStyle(
                                                            color: Colors .white,
                                                          ),
                                                        ),
                                                        alignment: Alignment.center,
                                                        width: 75,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            bottomRight: Radius.circular(8),
                                                            bottomLeft: Radius.circular(8),
                                                          ),
                                                          color:  Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                  ),
                                  SizedBox(height: 10,child: Divider(
                                    height: 1,
                                  )),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text("  احجز أونلاين، ادفع في العيادة!\n  الدكتور يشترط الحجز المسبق!"),
                                      Icon(Icons.calendar_month,color: Colors.green,size: 48,),
                                      Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  )
                :Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex:1,child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 500,
                            width: 400,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text("معلومات الحجز",textDirection: TextDirection.rtl,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    ),
                                    color: const Color.fromRGBO(0, 112, 205, 1),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("احجـــز",style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600
                                ),),
                                Text("كشف طبي",style: TextStyle(
                                  color: Colors.blue,
                                    fontSize: 18
                                ),),
                                Text('  500 جنيه',textDirection: TextDirection.rtl,),
                                SizedBox(height: 10,child: Divider(
                                  height: 1,
                                ),
                                    ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 280,),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: Column(
                                        children: [
                                          Container(),
                                          Text(title),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            DoctorInfo["image"] == null
                                                ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                                : DoctorInfo["image"],
                                          )),
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(height: 10,child: Divider(
                            height: 1,
                          )),

                            Text("اخـتــــــــار ميعاد الــحــجــز",style: TextStyle(
                                    fontSize: 18
                                ),),
                                SizedBox(height: 10,),
                                BlocBuilder<DoctorCubit, MainDoctorState>(
                                    builder: (context, state) {
                                    return cubit.days.isEmpty  ? Text("لا توجد مواعيد") : Container(
                                      height:clinic=="bu_cdimy"? 1200:200,
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: cubit.dateTimes.length,
                                        scrollDirection: Axis.horizontal,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (c, i) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClientBookingScreen(
                                                        IDDoctor: IDDoctor,
                                                        clinic: clinic,
                                                        DoctorInfo: DoctorInfo,
                                                        date:"",
                                                      ),
                                                ));
                                              },
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        cubit.days[i],
                                                        style: TextStyle(
                                                          color: Colors .white,
                                                        ),
                                                      ),
                                                      alignment: Alignment.center,
                                                      width: 75,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(8),
                                                          topLeft: Radius.circular(8),
                                                        ),
                                                        color: const Color.fromRGBO(0, 112, 205, 1),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:75,
                                                      height: 100,
                                                      alignment: Alignment.center,
                                                      padding: EdgeInsets.only(left: 5,right: 5),
                                                      child: Text(cubit.dateTimes[i],textAlign: TextAlign.center,),),
                                                    Container(
                                                      child: Text(
                                                        "احجز الان",
                                                        style: TextStyle(
                                                          color: Colors .white,
                                                        ),
                                                      ),
                                                      alignment: Alignment.center,
                                                      width: 75,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          bottomRight: Radius.circular(8),
                                                          bottomLeft: Radius.circular(8),
                                                        ),
                                                        color:  Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                ),
                                SizedBox(height: 10,child: Divider(
                                  height: 1,
                                )),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text("  احجز أونلاين، ادفع في العيادة!\n  الدكتور يشترط الحجز المسبق!"),
                                    Icon(Icons.calendar_month,color: Colors.green,size: 48,),
                                    Spacer(),
                                  ],
                                )
                              ],
                            ),
                        ),
                      ),),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 200.0,left: 180,right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Spacer(),
                                  Container(

                                    padding: EdgeInsets.only(left: 20,),
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
                                    height:clinic=="bu_cdimy"? 1200:200,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                         // مسافة بين الصورة والنصوص
                                        Padding(
                                          padding: const EdgeInsets.only(top: 80.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    DoctorInfo["name"],
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                      color: Colors.grey.shade600,
                                                      fontSize: 20,
                                                    ),
                                                    textDirection: TextDirection.rtl,
                                                  ),
                                                  SizedBox(height: 5), // مسافة بين النصوص
                                                  clinic=="bu_cdimy"?  SizedBox(
                                                    height:clinic=="bu_cdimy"? 1200:200,
                                                    child: Text(
                                                      clinic == "bu_cdimy"
                                                          ? Aboutusconst.BeatyAcamdemy
                                                          : DoctorInfo["pio"],
                                                      style: TextStyle(
                                                        color: Colors.grey.shade400,
                                                        fontSize: 16
                                                      ),
                                                      textDirection: TextDirection.rtl,
                                                    ),
                                                  ): SizedBox(
                                                    width: 600,
                                                    child: Text(
                                                      clinic == "bu_cdimy"
                                                          ? Aboutusconst.BeatyAcamdemy
                                                          : DoctorInfo["pio"],
                                                      style: TextStyle(
                                                          color: Colors.grey.shade400,
                                                          fontSize: 16
                                                      ),
                                                      textDirection: TextDirection.rtl,
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 40.0,),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  DoctorInfo["image"] == null
                                                      ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                                      : DoctorInfo["image"],
                                                ),
                                                fit: BoxFit.cover
                                              )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 285),
                            child: Container(
                              width: screenWidth > 600 ? 500 : screenWidth * 0.9,
                              height: 150,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(width: screenWidth > 600 ? 375 : screenWidth * 0.1),
                                      Text(
                                        "عن الدكتور",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        Icons.info_outline,
                                        color: Color.fromRGBO(0, 112, 205, 1.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      DoctorInfo["pio"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
            BlocBuilder<DoctorCubit, MainDoctorState>(
              builder: (context, state) {
                return state is DoctorLoadingState? CircularProgressIndicator() : Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 140.0),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ClientBookingScreen(
                                        IDDoctor: IDDoctor,
                                        clinic: clinic,
                                        DoctorInfo: DoctorInfo,
                                        date: "",
                                      )
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
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            MainBottomBar(),
          ],
        ),
      ),
    );
  }
}
