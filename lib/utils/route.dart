import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../auth/LoginLayerCheck.dart';
import '../doctor/DoctorProfile.dart';
import '../doctor/all_doctors.dart';
import '../main_screen/Contactus.dart';
import '../main_screen/about_us_screen.dart';
import '../main_screen/bu_acdimy.dart';
import '../pressintation/blog/blogdetails.dart';
import '../pressintation/blog/blogs.dart';
import '../pressintation/blog/choose_blog.dart';
import '../pressintation/blog/read_all_blogs.dart';
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<Map<String, String>> visionMissionValues = [
    {
      "title": "الرؤية",
      "text": "تقديم خدمات صحية شاملة بجودة عالمية وفق أحدث أساليب التكنولوجيا المتطورة والتطلع لتحقيق التميز والابتكار في مجال تقديم الخدمات الطبية بمستوى عالمي والتأكيد على نجاح عيادتنا الطبية في بناء علاقات وطيدة وقوية وإيجابية مع مرضانا."
    },
    {
      "title": "الرسالة",
      "text": "تقديم أعلى مستوى من الرعاية الصحية المتخصصة والتزامنا القوي بتقديم خدمات طبية متميزة وعالية الجودة في القطاع الصحي الخاص تهدف إلى الرقي بمستوى الخدمات الصحية بإستخدام أفضل الأجهزة الحديثة والمتطورة وأحدث ما توصلت إليه المعارف العلمية لخدمة مرضانا وتخفيف معاناتهم وتحقيق رضاهم وفق أعلى معايير الجودة العالمية."
    },
    {
      "title": "القيم",
      "text": "قيمنا تنبع من تميزنا برعاية مرضانا والالتزام بأعلى معايير الجودة:\n\n- العناية بالمريض: وضع احتياجات المرضى في المرتبة الأولى.\n- الجودة: السعي للتميز والجودة العالية من خلال الإبداع والابتكار.\n- التعاون: العمل سوياً لضمان تبادل المعرفة والحكمة لمصلحة الجميع وتعزيز العمل بروح الفريق الواحد."
    }
  ];
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pathPatterns = [
      BeamPage(
        child: Layer_check(),
        key: ValueKey('/'),
      ),
    ];
    if (state.uri.pathSegments.contains('Iodine_131')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('Iodine_131'),
          child: AllDoctors(Clinic:'comfrt_care' ,title: "وحدات اليود المشع",),
        ),
      );
    }
    if (state.uri.pathSegments.contains('beutyacademyclinics')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('beutyacademyclinics'),
          child: AllDoctors(Clinic: 'Beautyclinicacademy',title: "عيادات بيوتي اكاديمي",),
        ),
      );
    }
    if (state.uri.pathSegments.contains('salamtkclinics')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('salamtkclinics'),
          child: AllDoctors(Clinic:'slmtk',title:"عيادات سلامتك الحديثه" ),
        ),
      );
    }
    if (state.uri.pathSegments.contains('beutyacademytraining')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('beutyacademytraining'),
          child: BeautyAcademy(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('add_blogs')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('add_blogs'),
          child: Blogs(),
        ),
      );
    }
    final String? slmtlDoc = state.pathParameters['slamtk_doctor'];
    if (slmtlDoc!=null) {
      pathPatterns.add(
        BeamPage(
          key:  ValueKey('slamtk_doctor/$slmtlDoc'),
          child: ProfileDoctor(
            IDDoctor: slmtlDoc,
            clinic: "slmtk",
            title: "عيادات سلمتك",
          ),
        ),
      );
    }
    final String? butelDoc = state.pathParameters['beutyacademyclinics_doctors'];
    if (butelDoc!=null) {
      pathPatterns.add(
        BeamPage(
          key:  ValueKey('beutyacademyclinics_doctors/$butelDoc'),
          child:ProfileDoctor(
              IDDoctor: butelDoc,
              clinic: "beutyacademyclinics",
              title: "عيدات بيوتي",

          ),
        ),
      );
    }
    final String? blogDoc = state.pathParameters['blogs'];
    if (blogDoc!=null) {
      pathPatterns.add(
        BeamPage(
          key:  ValueKey('blogs/$blogDoc'),
          child:Blogdetails(
            blogId:blogDoc,
          ),
        ),
      );
    }

    if (state.uri.pathSegments.contains('about_us')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('about_us'),
          child:AboutUsScreen(text: visionMissionValues,image: "image/",),
        ),
      );
    }
    if (state.uri.pathSegments.contains('contact_us')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('contact_us'),
          child:Contactus(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('main_blogs')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('main_blogs'),
          child:ChooseBlog(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('all_blogs')) {
      pathPatterns.add(
        BeamPage(
          key: const ValueKey('all_blogs'),
          child:ReadAllBlogs(),
        ),
      );
    }
    return pathPatterns;
  }
  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => [
    '/',
    '/Iodine_131',
    '/about_us',
    '/contact_us',
    '/beutyacademytraining',
    "/salamtkclinics",
    "slamtk_doctor/:slamtk_doctor",
    "/add_blogs",
    "/all_blogs",
    "/beutyacademyclinics",
    "/blogs/:blogs",
    "/main_blogs",
    "beutyacademyclinics_doctors/:beutyacademyclinics_doctors",
  ];
}