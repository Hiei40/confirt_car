import 'package:confirt_care/doctor/DoctorSearch.dart';
import 'package:confirt_care/doctor/cubit/cubit.dart';
import 'package:confirt_care/doctor/cubit/state.dart';
import 'package:confirt_care/doctor/widget/doctors_card.dart';
import 'package:confirt_care/doctor/widget/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main_screen/about_us_screen.dart';
import '../pressintation/Docotors/widget/fillter_drower.dart';
import '../utils/widget/app_bar.dart';
import '../utils/widget/main_bottom_bar.dart';
import 'DoctorProfile.dart';
import '../auth/login_screen.dart';
import '../auth/sign_up.dart';
import '../main_screen/main_bage.dart';
// cubit.allDoctorCategoryList
class AllDoctorsCategory extends StatelessWidget {
  const AllDoctorsCategory({super.key, required this.Clinic,required this.Category,required this.title});
  final String Clinic;
  final String Category;
  final String title;
  @override
  Widget build(BuildContext context) {
    TextEditingController Search = TextEditingController();
    DoctorCubit cubit = DoctorCubit.get(context);
    cubit.profile();
    cubit.allDoctorsCategory(Clinic,Category);
    List<Map<String, String>> Lap = [
      {
        "title": "مصطلح اليود المشع قد يكون مخيف لبعض الناس ماهو العلاج باليود المشع ؟؟",
        "text": "هو واحد من الطرق الحديثه والاساسيه فى الطب النووى لعلاج اورام الغده الدرقيه."
      },
      {
        "title": "العلاقة بين اليود و الغده الدرقيه",
        "text": "عنصر اليود موجود بالطبيعه ونستهلكه بصوره يوميه موجود فى العديد من الاطعمه مثل السمك والبيض والحليب وعن طريق المستقبلات التى تتميز بها خلايا الغده الدرقيه واللى مش موجوده بغير خلايا الجسم هتستهلك وتجمع عنصر اليود لغرض انتاج هرموناته."
      },
      {
        "title": "طبيعة العلاقه بين اليود والغده الدرقيه",
        "text": "تم تصنيع النظير المشع لليود الذى يحتوى على طاقه اشعاعيه نستخدمها كعلاج وبجرعات محدده يدخل الى خلايا الغده الدرقيه ويقوم بقتلها وتدميرها والتخلص منها."
      },
      {
        "title": "طريقة استخدام اليود المشع",
        "text": "نعطى جرعه اليود المشع على شكل كبسوله تؤخذ عن طريق الفم."
      },
      {
        "title": "استخدامات اليود المشع",
        "text": "* يستخدم فى علاج فرط نشاط الغده الدرقيه وكذلك نستخدمه بعد عمليات استئصال الغده الدرقيه خصوصا للامراض الحميده.\n* نستخدمه بصوره اساسيه كعلاج تكميلي بعد استئصال الغده الدرقيه لبعض انواع السرطانات.\n* ويستخدم كذلك لعلاج اساسى لبعض سرطانات الغده الدرقيه المنتشره فى انحاء الجسم مثل (العقد الليمفاوية والرئه وغيرها من مناطق الجسم).\n* نقدر نستخدمه بجرعات قليلة فى فحص الغده الدرقيه."
      },
      {
        "title": "تأكيد أمان العلاج باليود المشع",
        "text": "مصطلح اليود المشع قد يكون مخيف لبعض الناس بس هو فى الحقيقه علاج طبى امن وفعال والجرعه التى يتم اعطاؤها بيتم حسابها بصورة دقيقه حتى نضمن العلاج المثالى للمريض."
      },{
        "title":"مواعيد الحجز",
        "text":"مواعيدها يوميا من السبت للخميس من ٩ صباحا وحتي ٥ مساء"
      }
    ];
    return BlocBuilder<DoctorCubit, MainDoctorState>(builder: (context, state) {
      print(cubit.allDoctorList);
      return state is loadingState ? Scaffold(body: Center(child: CircularProgressIndicator(),),) : Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Clinic =="comfrt_care" ? AboutUsScreen(text: Lap,image: "image/comfrt_cover.jpg",)
            :  SingleChildScrollView(
          child:Column(
            children: [
              MainAppBar(),
              Column(
                children: [
                  DoctorSearchBar(title: title, Clinic: Clinic,cubit:cubit,isDoctor: false,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: LayoutBuilder(
                        builder: (context,constraints) {
                          return constraints.maxWidth < 600?Container(
                            width: 400,
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                                itemCount: cubit.allDoctorCategoryList.length,
                                itemBuilder: (c, i) {
                                  print(cubit.allDoctorCategoryList[i]["type"]);
                                  return DoctorsCard(
                                    dateDays: cubit.allDoctorList[i]["Bookingdays"]!= null ?cubit.allDoctorCategoryList[i]["Bookingdays"]:[],
                                    title: title,
                                    Clinic: Clinic,
                                    id: cubit.DocotorsId[i],
                                    mapDoctor: cubit.allDoctorCategoryList[i],
                                    mapProfile: cubit.profileMap,
                                    days: cubit.allDoctorCategoryList[i]["days"]!= null ?cubit.allDoctorCategoryList[i]["days"]:[],
                                    dateTimes:cubit.allDoctorCategoryList[i]["Booking date"]!= null ?cubit.allDoctorCategoryList[i]["Booking date"]:[],
                                  );
                                }),
                          ):
                          Container(
                            width: 1200,
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                                itemCount: cubit.allDoctorCategoryList.length,
                                itemBuilder: (c, i) {
                                  print(cubit.allDoctorCategoryList[i]["type"]);
                                  return DoctorsCard(
                                    dateDays: cubit.allDoctorList[i]["Bookingdays"]!= null ?cubit.allDoctorCategoryList[i]["Bookingdays"]:[],
                                    title: title,
                                    Clinic: Clinic,
                                    id: cubit.DocotorsCategoryId[i],
                                    mapDoctor: cubit.allDoctorCategoryList[i],
                                    mapProfile: cubit.profileMap,
                                    days: cubit.allDoctorCategoryList[i]["days"]!= null ?cubit.allDoctorCategoryList[i]["days"]:[],
                                    dateTimes:cubit.allDoctorCategoryList[i]["Booking date"]!= null ?cubit.allDoctorCategoryList[i]["Booking date"]:[],
                                  );
                                }),
                          );
                        }
                    ),
                  ),
                ],
              ),
              MainBottomBar(),
            ],
          ),
        ),
      );
    });
  }
}