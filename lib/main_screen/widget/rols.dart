import 'package:flutter/material.dart';

class Rols extends StatelessWidget {
  const Rols({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
        return Container(
          height:constraints.maxWidth < 600? 600:300,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // يغير موضع الظل
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 40,bottom: 40,right: 60),
          child:
          LayoutBuilder(
              builder: (context,constraints) {
                return constraints.maxWidth > 600? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0,right: 10,left: 10),
                            child: Icon(Icons.medical_services_outlined,color: Colors.blue,size: 30,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("كل احتياجاتك على كومفيرت كير",style: TextStyle(
                                  fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              SizedBox(height: 10,),
                              Text(
                                "ابحث و احجز كشف مع دكتور في عيادة، مستشفى،\nأ زيارة منزلية، و عبر مكالمة. ممكن كمان تطلب أدوية،\n أو تحجز خدمة أو عملية بأحسن سعر."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 80,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0.0,right: 10,left: 10),
                                child: Icon( Icons.feedback_outlined,color: Colors.blue,size: 30,),
                              ),
                              Text("تقييمات حقيقية من المرضى",style: TextStyle(
                                fontSize: 20,
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "تقييمات الدكاترة من مرضى حجزوا \n على كومفيرت كير و زاروا الدكتور بالفعل."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0.0,right: 10,left: 10),
                                child: Icon(   Icons.check_circle_outline,color: Colors.blue,size: 30,),
                              ),
                              Text("حجزك مؤكد مع الدكتور",style: TextStyle(
                                  fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "حجزك مؤكد بمجرد اختيارك من المواعيد المتاحة \n للدكتور."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 20,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0,right: 10,left: 10),
                            child: Icon( Icons.payment_outlined,color: Colors.blue,size: 30,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("احجز مجاناً، و ادفع في العيادة",style: TextStyle(
                                  fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "سعر الكشف على كومفيرت كير نفس سعر الكشف في العيادة، \n بدون أي  مصاريف إضافية."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ) : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          flex: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Text("كل احتياجاتك على كومفيرت",style: TextStyle(
                                fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              SizedBox(height: 10,),
                              Text(
                                "ابحث و احجز كشف مع دكتور في عيادة، مستشفى،\nأ زيارة منزلية، و عبر مكالمة. ممكن كمان تطلب أدوية،\n أو تحجز خدمة أو عملية بأحسن سعر."
                              ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50.0,right: 10,left: 10),
                            child: Icon(Icons.medical_services_outlined,color: Colors.blue,size: 30,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 80,),
                        Expanded(
                          flex: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("تقييمات حقيقية من المرضى",style: TextStyle(
                                  fontSize: 20,
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "تقييمات الدكاترة من مرضى حجزوا \n على كومفيرت كير و زاروا الدكتور بالفعل."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),

                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 75.0,right: 10,left: 10),
                            child: Icon( Icons.feedback_outlined,color: Colors.blue,size: 30,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 40,),
                        Expanded(
                          flex: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("حجزك مؤكد مع الدكتور",style: TextStyle(
                                fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "حجزك مؤكد بمجرد اختيارك من المواعيد المتاحة \n للدكتور."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 75.0,right: 10,left: 10),
                            child: Icon(   Icons.check_circle_outline,color: Colors.blue,size: 30,),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("احجز مجاناً، و ادفع في العيادة",style: TextStyle(
                                fontSize: 20
                              ),textDirection: TextDirection.rtl,),
                              Text(
                                "سعر الكشف على كومفيرت كير نفس سعر الكشف في العيادة، \n بدون أي  مصاريف إضافية."
                                ,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 750.0,right: 10,left: 10),
                            child: Icon( Icons.payment_outlined,color: Colors.blue,size: 30,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
}
