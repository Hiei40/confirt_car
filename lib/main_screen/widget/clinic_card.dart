import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key,required this.image,required this.name});
  final String ?image;
  final String ?name;

  @override
  Widget build(BuildContext context) {
    return             Container(
      height:150 ,
      width: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(12) ,bottomLeft:Radius.circular(12),),
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),

            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding:const EdgeInsets.only(left: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                   Text(name!,style:const TextStyle(
                      color: Colors.black
                  ),),
                  Text("Schedule a voice or video call with a specialized doctor.",style: TextStyle(
                      color: Colors.grey.shade400
                  ),),
                  Text("chose Doctor Now"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
