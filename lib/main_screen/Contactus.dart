import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';
class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
     body:  BlocBuilder<LoginCubit, LoginState>(
       builder: (context, state) {
         return SingleChildScrollView(
             child: Column(children: [
               MainAppBar(),
               SizedBox(
                 height: (1 / 30) * hieght,
               ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                       LayoutBuilder(
                           builder: (context,constraints) {
                             return constraints.maxWidth < 600? SizedBox(width: 100,):SizedBox(width: 890,);
                           }
                         ),
                         const Text(
                           "للتواصل معنا",
                           style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 26,
                               color: Colors.blue),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: (1 / 30) * hieght,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(
                           "العنوان",
                           style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 26,
                               color: Colors.blue),
                         ),
                         SizedBox(width: 20,),
                         Container(
                           child: const Text(
                             " 8 قطعة 1، شارع مصطفى النحاس، بجوار مدرسة المنهل، مدينة نصر، القاهرة",
                             style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 18,
                                 color: Colors.grey),
                             textDirection: TextDirection.rtl,
                           ),
                         ),
                         SizedBox(width: 20,),

                         Text(
                           "رقم الهاتف",
                           style: TextStyle(
                               fontWeight: FontWeight.w700,
                               fontSize: 26,
                               color: Colors.blue),
                         ),
                         SizedBox(width: 20,),

                         Container(
                           child: const Text(
                             "0223572009",
                             style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 18,
                                 color: Colors.grey),
                           ),
                         ),  SizedBox(
                           height: (1 / 30) * hieght,
                         ),  Container(
                           child: const Text(
                             "01050002288",
                             style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 18,
                                 color: Colors.grey),
                           ),
                         ), SizedBox(
                           height: (1 / 30) * hieght,
                         ), Container(
                           child: const Text(
                             "01050002288",
                             style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 18,
                                 color: Colors.grey),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 100,
                     ),
                   ],
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(top: 80.0),
                 child: MainBottomBar(),
               )
             ]));
       },
     ),
    );
  }
}
