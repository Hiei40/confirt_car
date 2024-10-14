import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';
import '../utils/widget/main_bottom_bar.dart';
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.text,required this.image });
  final List text;
  final String image;
  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SingleChildScrollView(
            child: Column(children: [
              MainAppBar(),

          SizedBox(
            width: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 580,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: (1 / 30) * hieght,
                ),
                SizedBox(
                  width: 1000,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: text.length,
                    itemBuilder: (context,i) {
                      return SizedBox(
                        width: 1000,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child:  Text(
                                    text[i]["title"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                        color: Colors.blue),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (1 / 30) * hieght,
                            ),
                            Container(
                              child:  Text(
                                text[i]["text"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.grey),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
              MainBottomBar(),
        ]));
      },
    ));
  }
}
