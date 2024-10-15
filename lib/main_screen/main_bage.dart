import 'package:carousel_slider/carousel_slider.dart';
import 'package:confirt_care/main_screen/widget/home_cards.dart';
import 'package:confirt_care/main_screen/widget/rols.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';
import '../utils/widget/app_bar.dart';
import 'widget/cover_page.dart';
import 'widget/main_card.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();
    final List<Map<String, String>> sliderData = [
      {
        'image': 'image/جلديه.jpeg',
        'text': 'جلدية '
      },
      {
        'image': 'image/نساء وتوليد.jpeg',
        'text': 'نسا وتوليد'
      },
      {
        'image': 'image/مخ واعصاب.jpeg',
        'text': "جراحه المخ والاعصاب "
      },
      {
        'image': 'image/عظام.jpeg',
        'text':" عظام "
      },
      {
        'image': 'image/اطفال.jpeg',
        'text': 'اطفال وحديث الولادة '
      },
    ];
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(children: [
            MainAppBar(),
          // Container(
          //   color: Color(0xFFf1f1f6),
          //   width: double.infinity,
          //   height: 200,
          //   child: Container(
          //     width: 800,
          //     child: LayoutBuilder(
          //       builder: (context,constraints){
          //   return CarouselSlider(
          //           options: CarouselOptions(
          //             enlargeCenterPage: true,
          //             height:constraints.maxWidth < 600? 120:120.0, // Adjust height as needed
          //             autoPlay: true,
          //             aspectRatio:constraints.maxWidth < 600? 16/8 :16/9,
          //             autoPlayCurve: Curves.fastOutSlowIn,
          //             enableInfiniteScroll: true,
          //             autoPlayAnimationDuration: Duration(milliseconds: 800),
          //             viewportFraction:constraints.maxWidth < 600? 0.44:.33, // 0.33 to show exactly three items
          //           ),
          //           items: sliderData.map((item) => Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: LayoutBuilder(
          //                 builder: (context,constraints) {
          //                 return constraints.maxWidth > 600 ?Container(
          //                   width: 200,
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(12),
          //                     color: Colors.white,
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(.5),
          //                         spreadRadius: 1,
          //                         blurRadius: 2,
          //                         offset: const Offset(0, 3),
          //                       ),
          //                     ],
          //                   ),
          //                   child: SizedBox(
          //                     height: 300,
          //                     width: 200,
          //                     child: Column(
          //                       children: <Widget>[
          //                         Container(
          //                           width: 200,
          //                           height: 250,
          //                           decoration: BoxDecoration(
          //                             color: Colors.blue,
          //                             borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12) ),
          //                             image: DecorationImage(
          //                               image: AssetImage(item['image']!),
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height:20,child: Text(item['text']!, style: TextStyle(fontSize: 14))),
          //                       ],
          //                     ),
          //                   ),
          //                 ):Container(
          //                   height: 120,
          //                   width: 200,
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(12),
          //                     color: Colors.white,
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.grey.withOpacity(.5),
          //                         spreadRadius: 1,
          //                         blurRadius: 2,
          //                         offset: const Offset(0, 3),
          //                       ),
          //                     ],
          //                   ),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     children: <Widget>[
          //                       Container(
          //                         width: 200,
          //                         height: 70,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12) ),
          //                           image: DecorationImage(
          //                             image: AssetImage(item['image']!),
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(height: 10),
          //                       Text(item['text']!, style: TextStyle(fontSize: 14)),
          //                     ],
          //                   ),
          //                 );
          //               }
          //             ),
          //           )).toList(),
          //         );
          //       }
          //     ),
          //   ),
          // ),
          SizedBox(
              height: 90,
            ),
            MainCard(),
            SizedBox(height: 100,),
            HomeCarde(),
            SizedBox(
              height: 90,
            ),
            SizedBox(
              height: 90,
            ),
          MainBottomBar(),
          ]),
        ),
      );
    });
  }
}
