import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../main_screen/Contactus.dart';
import '../../main_screen/about_us_screen.dart';
class IodineBottomBar extends StatelessWidget {
  const IodineBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> visionMissionValues = [
      {
        "title": "الرؤية",
        "text":
        "تقديم خدمات صحية شاملة بجودة عالمية وفق أحدث أساليب التكنولوجيا المتطورة والتطلع لتحقيق التميز والابتكار في مجال تقديم الخدمات الطبية بمستوى عالمي والتأكيد على نجاح عيادتنا الطبية في بناء علاقات وطيدة وقوية وإيجابية مع مرضانا."
      },
      {
        "title": "الرسالة",
        "text":
        "تقديم أعلى مستوى من الرعاية الصحية المتخصصة والتزامنا القوي بتقديم خدمات طبية متميزة وعالية الجودة في القطاع الصحي الخاص تهدف إلى الرقي بمستوى الخدمات الصحية بإستخدام أفضل الأجهزة الحديثة والمتطورة وأحدث ما توصلت إليه المعارف العلمية لخدمة مرضانا وتخفيف معاناتهم وتحقيق رضاهم وفق أعلى معايير الجودة العالمية."
      },
      {
        "title": "القيم",
        "text":
        "قيمنا تنبع من تميزنا برعاية مرضانا والالتزام بأعلى معايير الجودة:\n\n- العناية بالمريض: وضع احتياجات المرضى في المرتبة الأولى.\n- الجودة: السعي للتميز والجودة العالية من خلال الإبداع والابتكار.\n- التعاون: العمل سوياً لضمان تبادل المعرفة والحكمة لمصلحة الجميع وتعزيز العمل بروح الفريق الواحد."
      }
    ];
    List days=[
      "السبت",
      "الاحد",
      "الاثنين",
      "الثلاثاء",
      "الاربعاء",
      "الخميس",
    ];
    return Container(
      height: 727,
      width: double.infinity,
      color: const Color.fromRGBO(0, 112, 205, 1),
      child: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
            const SizedBox(
              width: 20,
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
                      builder: (context) => AboutUsScreen(
                        text: visionMissionValues,
                        image: "image/cover Image.jpg",
                      ),
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
                    )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
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
                        builder: (context) => AboutUsScreen(
                          text: visionMissionValues,
                          image: "image/cover Image.jpg",
                        ),
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
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: 600,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("المواعيد",style: TextStyle(
                      fontSize: 16,
                    ),),
                    ListView.builder(shrinkWrap: true,itemCount: days.length,itemBuilder: (c,i){
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
                        child: Row(
                          children: [
                            Text(" 9 ص - 5 م",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                            ),),
                            Spacer(),
                            Text("${days[i]}",style: TextStyle(
                                color: Colors.black,
                                fontSize: 18
                            ),),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
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
                                child: InkWell(
                                  onTap: () async {
                                    final Uri _url = Uri.parse(
                                        'https://www.facebook.com/profile.php?id=61553727613127&mibextid=ZbWKwL');
                                    await launchUrl(Uri.parse(
                                        'https://www.facebook.com/profile.php?id=61553727613127&mibextid=ZbWKwL'));
                                  },
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: SizedBox(),),
                            Expanded(
                              flex: 1,

                              child: SizedBox(),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
