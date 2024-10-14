import 'package:flutter/material.dart';
import '../../pressintation/Docotors/widget/fillter_drower.dart';
class DoctorSearchBar extends StatelessWidget {
  const DoctorSearchBar({super.key, required this.title,required this.cubit, required this.Clinic,required this.isDoctor});
  final String title;
  final cubit;
  final String Clinic;
  final bool isDoctor;
  @override

  Widget build(BuildContext context) {
    TextEditingController Search = TextEditingController();
    return  LayoutBuilder(
        builder: (context,constraints) {
          return constraints.maxWidth < 600?Container(
            child: Padding(
              padding:
              const EdgeInsets.only(right: 50.0, top: 20),
              child: SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // SizedBox(width: 96,),
                    Spacer(),
                    DropDownTypeList(
                      width: 150,
                      list: cubit.categoryList,
                      fun: cubit,
                      clinc: Clinic,
                      title: title,
                    ),
                    // SizedBox(width: 20,),
                  ],
                ),
              ),
            ),
          ) :Container(
          height: 300,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only( bottom: 40),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("image/search-header-background.jpg"),
                        fit:BoxFit.cover ,
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(isDoctor==false?
                        "احجز مع أفضل دكاترة   ${title} ":
                      "احجز مع  دكتور  ${title} ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 112, 114, 1),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "احجز اونلاين او كلم ٠١٠٥٠٠٠٢٢٨٨",
                        style: TextStyle(
                          color: Color.fromRGBO(111, 112, 114, 1),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Text(
                      //   "١٥٠٠٠ دكتور -٩٠٠٠ استاذ واستشاري - اكثر من ٤٠ تخصص",
                      //   style: TextStyle(
                      //     color: Color.fromRGBO(111, 112, 114, 1),
                      //   ),
                      // ),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 350.0, top: 20),
                        child: SizedBox(
                          width: 1600,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 196,),
                              DropDownTypeList(
                                width: 150,
                                list: cubit.categoryList,
                                fun: cubit,
                                clinc: Clinic,
                                title: title,
                              ),
                              SizedBox(width: 20,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
