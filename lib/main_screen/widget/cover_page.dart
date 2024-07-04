import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFF00e6f6).withOpacity(.1),
      child: Row(children: [
        Expanded(flex: 1,child: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Find Best Clinic\nTo Get Solutions",style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 40,),
              Text("Comfort Care Medical Services Company is the owner of the\nSalamatak Modern Specialized Clinics project and is one of the\nleading companies in managing and operating specialized clinics,\nusing the latest international equipment and technologies and the\nmost prominent specialists among doctors, researchers, and nurses in Egypt.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
              ),
              SizedBox(height: 80,),
            ],
          ),
        ),)
      ],),
    );
  }
}
