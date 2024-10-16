import 'package:confirt_care/utils/widget/app_bar.dart';
import 'package:confirt_care/utils/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import '../auth/cubit/cubit.dart';
import '../auth/cubit/state.dart';

class Iodine extends StatefulWidget {
  const Iodine({super.key, required this.text, required this.image});
  final List text;
  final String image;

  @override
  _IodineState createState() => _IodineState();
}

class _IodineState extends State<Iodine> with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    // Initialize the GifController
    _gifController = GifController(vsync: this);
    _gifController.repeat(period: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    cubit.profile();

    List<String> iodineTreatmentTopics = [
      '١. العلاج باليود المشع لسرطانات الغدة الدرقية',
      '٢. اسعار جرعة اليود المشع',
      '٣. أسباب استخدام طرق العلاج باليود المشع',
      '٤. نصائح مهمة بعد العلاج باليود المشع',
      '٥. طريقة العلاج وعدد جلسات اليود المشع',
      '٦. الآثار الجانبية والاحتياطات للعلاج باليود المشع',
      '٧. سعر جرعة اليود المشع'
    ];

    List<String> days = [
      "السبت",
      "الاحد",
      "الاثنين",
      "الثلاثاء",
      "الاربعاء",
      "الخميس",
    ];

    double height = MediaQuery.of(context).size.height;
    final ScrollController _controller = ScrollController();

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
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
                            child: Gif(
                              controller: _gifController,
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        return Padding(
                          padding: constraints.maxWidth < 600
                              ? const EdgeInsets.only(left: 0.0, top: 40)
                              : const EdgeInsets.only(left: 600.0, top: 40),
                          child: Container(
                            height: 200,
                            width: 400,
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            color: Colors.grey.shade200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: iodineTreatmentTopics.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    if (i != 0) {
                                      _controller.animateTo(
                                        i * (200 + 200.0),
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      _controller.animateTo(
                                        (100 + 200.0),
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 200,
                                    padding: const EdgeInsets.only(right: 10),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "${iodineTreatmentTopics[i]}",
                                      style: const TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: (1 / 30) * height,
                      ),
                      SizedBox(
                        width: 1000,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.text.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
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
                                        child: Text(
                                          widget.text[i]["title"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 26,
                                            color: Colors.blue,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: (1 / 30) * height,
                                  ),
                                  Text(
                                    widget.text[i]["text"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, bottom: 20),
                      child: Container(
                        height: 650,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "المواعيد",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: days.length,
                              itemBuilder: (c, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "9 ص - 5 م",
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${days[i]}",
                                        style: const TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    MainBottomBar(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
