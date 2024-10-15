import 'package:flutter/material.dart';

class MobileMainCard extends StatelessWidget {
  const MobileMainCard({super.key,required this.image,required this.text,required this.title});
  final String image;
  final String text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
     width: 320,
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
       borderRadius: BorderRadius.circular(20),
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         Expanded(flex: 12,child:Container(
           height: 200,
           width: 320,
           decoration: BoxDecoration(
             image: DecorationImage(image: NetworkImage(image),
               fit: BoxFit.fill
             ),
             borderRadius: BorderRadius.circular(20),
           ),
         ), ),
         Expanded(flex: 10,child:Container(
           padding: EdgeInsets.only(left: 10,right: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               SizedBox(height: 15,),
               Text(title,textDirection: TextDirection.rtl,style: TextStyle(
                 fontSize: 20,
                 color: Colors.blue.shade600,
               ),),
               SizedBox(height: 15,),
               Text(text,textDirection: TextDirection.rtl),
             ],
           ),
         ), ),

       ],
     ),
    );
  }
}
