import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
          return constraints.maxWidth < 600?  Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: Container(
              height:200 ,
              width: 800,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20,),
                Text("كومفرت كير جروب ",style: TextStyle(
                  color: const Color.fromRGBO(0, 112, 205, 1),
                  fontSize: 20,
                ),textDirection: TextDirection.rtl,),
                SizedBox(height: 20,),
                Text("تضم الشركة أطباء متميزين في مختلف الوحدات. مجموعة اليود المشعة هي مجموعة من العيادات المتخصصة في مجالات التجميل والرعاية الصحية والأمراض الجلدية وغيرها. تهدف العيادات إلى تحقيق الجمال والصحة للمرضى من خلال تخصصات مثل الجراحة التجميلية وطب الأسنان، حيث تقدم خدمات عالية الجودة وبأحدث التقنيات.",
                  style: TextStyle(
                      color:   Colors.grey.shade800,
                    fontSize: 12
                  ),textDirection: TextDirection.rtl,
                ),
              ],
            ),
            ),
          ):
         Container(
          height:200 ,
          width: 800,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20,right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),                child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20,),
            Text("كومفرت كير جروب ",style: TextStyle(
              color: const Color.fromRGBO(0, 112, 205, 1),
              fontSize: 20,
            ),textDirection: TextDirection.rtl,),
            SizedBox(height: 20,),
            Text("تضم الشركة أطباء متميزين في مختلف الوحدات. مجموعة اليود المشعة هي مجموعة من العيادات المتخصصة في مجالات التجميل والرعاية الصحية والأمراض الجلدية وغيرها. تهدف العيادات إلى تحقيق الجمال والصحة للمرضى من خلال تخصصات مثل الجراحة التجميلية وطب الأسنان، حيث تقدم خدمات عالية الجودة وبأحدث التقنيات.",
              style: TextStyle(
                  color:   Colors.grey.shade800
              ),textDirection: TextDirection.rtl,
            ),
          ],
        ),
        );
      }
    );

  }
}
