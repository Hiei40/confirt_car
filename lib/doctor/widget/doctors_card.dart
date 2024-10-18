import 'package:flutter/material.dart';
import '../ClientBookingScreen.dart';
import '../DoctorProfile.dart';
import '../course.dart';
class DoctorsCard extends StatelessWidget {
  const DoctorsCard({super.key,
    required this.mapDoctor,
    required this.Clinic,
    required this.id,
    required this.title,
    required this.mapProfile,
    required this.days,
    required this.dateTimes, required this.dateDays});
  final Map<String,dynamic>mapDoctor;
  final String id;
  final String Clinic;
  final String title;
  final Map mapProfile;
  final List days;
  final List dateDays;
  final List dateTimes;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          return constraints.maxWidth < 600?
         InkWell(
          onTap: () {
            if(Clinic=="bu_cdimy"){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CoursePage(
                  IDDoctor: id,
                  clinic: Clinic,
                  DoctorInfo: mapDoctor,
                  ProfileInfo: mapProfile,
                    title:title
                ),
              ));}else{
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileDoctor(
                  IDDoctor: id,
                  clinic: Clinic,
                  DoctorInfo: mapDoctor,
                    title:title

                ),
              ));
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 20, right: 20),
                child: Container(
                  height: 400,
                  alignment: Alignment.topRight,
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
                    children: [
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.end,
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${mapDoctor["name"]}",
                                  style: TextStyle(
                                      color: Colors
                                          .blueAccent.shade700,
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                Container(
                                  width: 140,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    title=="بيوتي اكاديمي"?"": "التخصص :${mapDoctor["type"]}",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mapDoctor["number"].toString()}:الكشف ",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                  ),
                                ),

                                Text(
                                  "الفروع: ${title}",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 40.0, left: 20,right: 20),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(mapDoctor["image"] ==
                                          null
                                          ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                          :mapDoctor["image"]),
                                      fit: BoxFit.cover)),
                            ),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            height:300,
                            alignment: Alignment.center,
                            width: 400,
                            child: ListView.builder(
                              itemCount: days.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (c, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            ClientBookingScreen(
                                              IDDoctor: id,
                                              clinic: Clinic,
                                              DoctorInfo: mapDoctor,
                                              date:"",
                                            ),
                                      ));                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  days[i],
                                                  style: TextStyle(
                                                    color: Colors .white,
                                                  ),
                                                ),

                                                Text(
                                                  "${dateDays[i]}",
                                                  style: TextStyle(
                                                    color: Colors .white,
                                                  ),                                                ),
                                              ],
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
                                            child: Text(dateTimes[i],textAlign: TextAlign.center,),),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ):
          InkWell(
            onTap: () {
              if(Clinic=="bu_cdimy"){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CoursePage(
                      IDDoctor: id,
                      clinic: Clinic,
                      DoctorInfo: mapDoctor,
                      ProfileInfo: mapProfile,
                      title:title
                  ),
                ));}else{
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileDoctor(
                      IDDoctor: id,
                      clinic: Clinic,
                      DoctorInfo: mapDoctor,
                      title:title

                  ),
                ));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 20, right: 20),
                  child: Container(
                    height: 240,
                    alignment: Alignment.topRight,
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
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0,right: 100),
                          child: SizedBox(
                            height: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                days.isEmpty  ?  SizedBox(
                                  width: 400,
                                  child: Container(
                                    width: 300,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(8),
                                      child: Text("لا توجد مواعيد متاحه",style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                    ),
                                  ),
                                ) : SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Container(
                                    height:300,
                                    alignment: Alignment.center,
                                    width: 400,
                                    child: ListView.builder(
                                      itemCount: days.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (c, i) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClientBookingScreen(
                                                        IDDoctor: id,
                                                        clinic: Clinic,
                                                        DoctorInfo: mapDoctor,
                                                        date:"",
                                                      ),
                                              ));
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          days[i],
                                                          style: TextStyle(
                                                            color: Colors .white,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${dateDays[i]}",
                                                          style: TextStyle(
                                                            color: Colors .white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    alignment: Alignment.center,
                                                    width: 75,
                                                    height: 40,
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
                                                    child: Text(dateTimes[i],textAlign: TextAlign.center,),),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${mapDoctor["name"]}",
                              style: TextStyle(
                                  color: Colors
                                      .blueAccent.shade700,
                                  fontSize: 20,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                            Container(
                              width: 200,
                              alignment: Alignment.centerRight,
                              child: Text(
                                title=="بيوتي اكاديمي"?"": "التخصص :${mapDoctor["type"]}",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Text(
                              "${mapDoctor["number"].toString()}:الكشف ",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 400,
                              child: Text(
                                title=="بيوتي اكاديمي"?"": "الوصف :${mapDoctor["pio"]}",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "الفروع: ${title}",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 100.0, left: 20),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(mapDoctor["image"] ==
                                        null
                                        ? "https://firebasestorage.googleapis.com/v0/b/comfort-care-web-site.appspot.com/o/Doctors%2F9193824.png?alt=media&token=cc4670cf-1a0a-4161-8091-ad39afffad40"
                                        :mapDoctor["image"]),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
      }
    );
  }
}
