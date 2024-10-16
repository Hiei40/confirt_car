import 'package:beamer/beamer.dart';
import 'package:confirt_care/main_screen/widget/clinic_card.dart';
import 'package:flutter/material.dart';
import '../../Const/Class PhotoClinics.dart';
import 'mobile_main_card.dart';

class HomeCarde extends StatelessWidget {
  const HomeCarde({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth < 600
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          child: constraints.maxWidth < 600
                              ? MobileMainCard(
                                  text:
                                      "أفضل الأطباء في كافة التخصصات الطبية بمدينة نصر - القاهرة",
                                  image: photoClinics.salamtak,
                                  title: "عيادات سلامتك الحديثه")
                              : ClinicCard(
                                  name:
                                      "أفضل الأطباء في كافة التخصصات الطبية بمدينة نصر - القاهرة",
                                  image: photoClinics.salamtak,
                                  pio: "عيادات سلامتك الحديثه"),
                          onTap: () {
                            context.beamToNamed('/salamtkclinics');
                          },
                        ),
                        const SizedBox(height: 60),
                        InkWell(
                          child: constraints.maxWidth < 800
                              ? MobileMainCard(
                                  text:
                                      "وحدات متخصصة مرخصة من هيئة الإشراف على الأمراض النووية لحجز علاج الغدة الدرقية باليود المشع",
                                  image: photoClinics.ComfortCare,
                                  title: "وحدات اليود المشع",
                                )
                              : ClinicCard(
                                  pio:
                                      "وحدات متخصصة مرخصة من هيئة الإشراف على الأمراض النووية لحجز علاج الغدة الدرقية باليود المشع",
                                  image: photoClinics.ComfortCare,
                                  name: "وحدات اليود المشع",
                                ),
                          onTap: () {
                            context.beamToNamed('/Iodine_131');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              context.beamToNamed('/beutyacademytraining');
                            },
                            child: constraints.maxWidth < 800
                                ? MobileMainCard(
                                    image: photoClinics.BeautyAcademy,
                                    title: " بيوتي اكاديمي",
                                    text:
                                        "أفضل المحاضرين المعتمدين من البورد بالجامعة الأمريكية بمدينة نصر")
                                : ClinicCard(
                                    image: photoClinics.BeautyAcademy,
                                    name: " بيوتي اكاديمي",
                                    pio:
                                        "أفضل المحاضرين المعتمدين من البورد بالجامعة الأمريكية بمدينة نصر")),
                        const SizedBox(height: 60),
                        InkWell(
                          child: constraints.maxWidth < 600
                              ? MobileMainCard(
                                  text: "أفضل دكاترة الجلدية في مدينة نصر",
                                  image: photoClinics.BeautyClinicAcademy,
                                  title: "عيادات بيوتي اكاديمي")
                              : ClinicCard(
                                  pio: "أفضل دكاترة الجلدية في مدينة نصر",
                                  image: photoClinics.BeautyClinicAcademy,
                                  name: "عيادات بيوتي اكاديمي"),
                          onTap: () {
                            context.beamToNamed('/beutyacademyclinics');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      child: constraints.maxWidth > 800
                          ? ClinicCard(
                              pio:
                                  "أفضل الأطباء في كافة التخصصات الطبية بمدينة نصر - القاهرة",
                              image: photoClinics.salamtak,
                              name: "عيادات سلامتك الحديثه")
                          : MobileMainCard(
                              text:
                                  "أفضل الأطباء في كافة التخصصات الطبية بمدينة نصر - القاهرة",
                              image: photoClinics.salamtak,
                              title: "عيادات سلامتك الحديثه"),
                      onTap: () {
                        context.beamToNamed('/salamtkclinics');
                      },
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      child: constraints.maxWidth < 800
                          ? MobileMainCard(
                              text:
                                  "وحدات متخصصة مرخصة من هيئة الإشراف على الأمراض النووية لحجز علاج الغدة الدرقية باليود المشع",
                              image: photoClinics.ComfortCare,
                              title: "وحدات اليود المشع",
                            )
                          : ClinicCard(
                              pio:
                                  "وحدات متخصصة مرخصة من هيئة الإشراف على الأمراض النووية لحجز علاج الغدة الدرقية باليود المشع",
                              image: photoClinics.ComfortCare,
                              name: "وحدات اليود المشع",
                            ),
                      onTap: () {
                        context.beamToNamed('/Iodine_131');
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
                          context.beamToNamed('/beutyacademytraining');
                        },
                        child: constraints.maxWidth < 800
                            ? MobileMainCard(
                                image: photoClinics.BeautyAcademy,
                                title: " بيوتي اكاديمي",
                                text:
                                    "أفضل المحاضرين المعتمدين من البورد بالجامعة الأمريكية بمدينة نصر")
                            : ClinicCard(
                                image: photoClinics.BeautyAcademy,
                                name: " بيوتي اكاديمي",
                                pio:
                                    "أفضل المحاضرين المعتمدين من البورد بالجامعة الأمريكية بمدينة نصر")),
                    const SizedBox(width: 20),
                    InkWell(
                      child: constraints.maxWidth < 800
                          ? MobileMainCard(
                              text: "أفضل دكاترة الجلدية في مدينة نصر",
                              image: photoClinics.BeautyClinicAcademy,
                              title: "عيادات بيوتي اكاديمي")
                          : ClinicCard(
                              pio: "أفضل دكاترة الجلدية في مدينة نصر",
                              image: photoClinics.BeautyClinicAcademy,
                              name: "عيادات بيوتي اكاديمي"),
                      onTap: () {
                        context.beamToNamed('/beutyacademyclinics');
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            );
    });
  }
}
