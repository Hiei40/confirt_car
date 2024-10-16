import 'package:confirt_care/doctor/cubit/cubit.dart';
import 'package:confirt_care/doctor/cubit/state.dart';
import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_screen/iodine.dart';
import 'widget/doctors_card.dart';
import 'widget/search.dart';
class AllDoctors extends StatelessWidget {
  const AllDoctors({super.key, required this.Clinic, required this.title});
  final String Clinic;
  final String title;
  List<DateTime> getDaysInCurrentMonth() {
    var now = DateTime.now(); // Get current date
    var year = now.year;
    var month = now.month;

    var firstDayOfMonth = DateTime(year, month, 1);
    var nextMonth = (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    var lastDayOfMonth = nextMonth.subtract(Duration(days: 1));
    return List<DateTime>.generate(
      lastDayOfMonth.day,
          (index) => DateTime(year, month, index + now.day),
    );
  }
  @override
  Widget build(BuildContext context) {
    DoctorCubit cubit = DoctorCubit.get(context);
    cubit.profile();
    cubit.allDoctors(Clinic);
    List<Map<String, String>> Lap = [
      {
        "title": "العلاج باليود المشع لسرطانات الغدة الدرقية",
        "text": "بعد التحليل و الدرسات و البحوث التى أجرت على العلاج باليود المشع للمرضى المختارين ما بعد الجراحة من الجراحة \n الصحيحة يتم الشفاء من  المرض تماما لأكثر من 95٪ من المرضى."
      },
      {
        "title": "اسعار جرعة اليود المشع",
        "text": "ستخدم اليود المشع فى علاج معضم أمراض الغدد الصماء , كما انه علاج سريع جدا و فعال , و يجب أتخاذ \n الاجرائات السلامة و الوقاية و الاعتبارات عند التعامل مع هذه المادة المشعة . \n\n و نظرة لكفائة العلاج و الادوية فأن سعر العلاج مرتفع نسبياً , و يتراوح سعر علاج اليود المشع من٨٠٠٠ جنية الى  \n ٢٠٠٠٠ جنية ."
      },
      {
        "title": "أسباب أستخدام طرق العلاج باليود المشع",
        "text": " . يستخدم فى علاج فرط نشاط الغدة الدرقية و افراز زائد للهرمون الذي يسبب تسمم فى الجسم . \n . يستخدم اليود المشع فى علاج الحالات الحرجة و الحاجة الى أنقاذ سريع , مثل تعرض المريض الى قصور الغدة الدرقية . \n  . يساعد استخدام اليوم المشع فى وضوح تفاصيل الغده الدرقية المصابة , و تحديد المنطقة المصابة و بناء على ذلك \n توضويح و تحديد اذا كانت تستدعي تدخل جراحي . \n  . علاج فعال جدا فى أستئصال الاورام الخبيثة و بالاخص التى تصيب الغدة الدرقية بعد الجراحة , لانة يقتل كل الخلايا المتبقة بشكل شبه كامل و من ثم منع الورم العودة الى المنطقة المصابة . \n  يستخدم أيضا لالتهاب الغدة الدرقية و الظروف التي يحدث فيها أرتجاع المريء . \n يستخدم اليود المشع فى حالات تسمم الغدة و أرجاع نشاطها مرة أخري . \n . اذا كان الهدف من استخدام, اليود المشع قتلا خلايا الغدة الدرقية . \n  . يلجاء الاطباء لاستخدام جرعات كبيرة فى تلك الحالة أذا كان هناك ورم فى الغدة .."
      },
      {
        "title": "نصائح مهمة بعد العلاج باليود المشع",
        "text":"غسل ملابس المريض بعيد عن أي ملابس أخرى. \n . اتباع المدة التي يحددها الطبيب للمريض بالعزل عن الآخرين. \n . اتباع نظام غذائي الهدف منه تقليل كمية اليود قبل أخذ الجرعة بثلاثة أسابيع.\n . تجنب الحمل في أول ستة شهور من العلاج واستخدام موانع الحمل.\n . التوقف عن الرضاعة لمدة ثمان أسابيع لتجمع اليود في أنسجة الثدي وهذا ضرر للطفل.\n . إجراء المريض تحليل كل شهر.\n . شرب كميات كبيرة من السوائل أثناء العلاج لتعويض الجفاف.\n . عدم التفاعل مع الأطفال بعد تناول الدواء أو الجرعة."
      },
      {
        "title": "سعر جرعة اليود المشع",
        "text": "* يستخدم فى علاج فرط نشاط الغده الدرقيه وكذلك نستخدمه بعد عمليات استئصال الغده الدرقيه خصوصا للامراض الحميده.\n* نستخدمه بصوره اساسيه كعلاج تكميلي بعد استئصال الغده الدرقيه لبعض انواع السرطانات.\n* ويستخدم كذلك لعلاج اساسى لبعض سرطانات الغده الدرقيه المنتشره فى انحاء الجسم مثل (العقد الليمفاوية والرئه وغيرها من مناطق الجسم).\n* نقدر نستخدمه بجرعات قليلة فى فحص الغده الدرقيه."
      },
      {
        "title": "تأكيد أمان العلاج باليود المشع",
        "text": "معظم الحالات المرضية فإن المريض بحاجة إلى جرعة واحدة فقط، والتي بعدها يتم متابعة تأثيرها.\nخلال بضعة أسابيع إلى أشهر، ثم بعدها يجري المريض بعض الفحوصات والتحاليل وصور الغدة الدرقية لتحديد جرعة ثانية من اليود المشع، لكن ليس قبل مدة 6 شهور على الأقل من الجرعة الأولى.\n"
      },{
      "title":"الآثار الجانبية والاحتياطات للعلاج باليود المشع؟",
        "text":"تعتبر كبسولة اليود المشع ليست لها طعم أو رائحة سيئة؛ حيث أن المصاب لا يشعر بأي شيء أثناء العلاج.\nوهو مختلف تمامًا عن طرق العلاج الكيميائي الأخرى، حيث لا يحدث تساقط الشعر أثناء العلاج.\nكما أن الآثار الجانبية المعدية نادرة حدوثها.\nكما يتم تقديم بعض التوصيات لتجنب الآثار الخطيرة للعلاج على الغدة.\nبما في ذلك، يضمن شرب السوائل الوفيرة والاستحمام اليومي أن الإشعاع يفرز من خلال سوائل الجسم.\nلا يُسمح لأي مريض بالزيارة أثناء العلاج النشط وتتم تلبية جميع احتياجات المريض من قبل موظفي الرعاية الصحية.\n"
      },{
    "title":"الآثار الجانبية والاحتياطات للعلاج باليود المشع؟",
    "text":"سعر جرعة اليود المشع\nأسعار اليود المشع 2023 تتراوح سعر الجرعة من 8000 جنيه إلى 20000 جنيه.\nوتحدد جرعة اليود المشع من طبيب الأشعة بالتعاون مع طبيب الغدد الصماء.\nوحرصًا على سلامة المريض يجب عدم تناول أي طعام يحتوي على يود قبل إجراء العملية.\n",
  }
  ];
    List<DateTime> daysInCurrentMonth = getDaysInCurrentMonth();

    return BlocBuilder<DoctorCubit, MainDoctorState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Clinic =="comfrt_care" ? Iodine(text: Lap,image: "image/e58b239e.gif",)
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
                            height:700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                                itemCount: cubit.allDoctorList.length,
                                itemBuilder: (c, i) {
                                  return DoctorsCard(
                                    dateDays: cubit.allDoctorList[i]["Bookingdays"]!= null ?cubit.allDoctorList[i]["Bookingdays"]:[],
                                    title: title,
                                    Clinic: Clinic,
                                    id: cubit.DocotorsId[i],
                                    mapDoctor: cubit.allDoctorList[i],
                                    mapProfile: cubit.profileMap,
                                    days: cubit.allDoctorList[i]["days"]!= null ?cubit.allDoctorList[i]["days"]:[],
                                    dateTimes:cubit.allDoctorList[i]["Booking date"]!= null ?cubit.allDoctorList[i]["Booking date"]:[],
                                  );
                                }),
                          ):
                      Container(
                          width: 1200,
                          height:cubit.allDoctorList.isEmpty? 700:cubit.allDoctorList.length * 302.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                              itemCount: cubit.allDoctorList.length,
                              itemBuilder: (c, i) {
                                return DoctorsCard(
                                  title: title,
                                  dateDays: cubit.allDoctorList[i]["Bookingdays"]!= null ?cubit.allDoctorList[i]["Bookingdays"]:[],
                                  Clinic: Clinic,
                                  id: cubit.DocotorsId[i],
                                  mapDoctor: cubit.allDoctorList[i],
                                  mapProfile: cubit.profileMap,
                                  days: cubit.allDoctorList[i]["days"]!= null ?cubit.allDoctorList[i]["days"]:[],
                                    dateTimes:cubit.allDoctorList[i]["Booking date"]!= null ?cubit.allDoctorList[i]["Booking date"]:[],
                                );
                              }),
                        );
                      }
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              MainBottomBar(),
            ],
          ),
        ),
      );
    });
  }
}
