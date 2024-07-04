import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Professional Team",style: TextStyle(
            color: Color(0xFF3559DA),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          Text("Meet Our Experience Team",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),),
          SizedBox(
            height: 300,
            width: 800,
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:(c,i){
                  return Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Container(
                      height: 280,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/about_image.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                           padding: EdgeInsets.only(left: 10.0,top: 10),
                           child:  SizedBox(
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("shehab",style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("code doctor",style: TextStyle(
                                    fontSize: 16,
                                  ),),
                                ],
                              ),
                            ),
                         ),
                        ],
                      ),
                    ),
                  );
                } ),
          ),
        ],),
    );
  }
}
