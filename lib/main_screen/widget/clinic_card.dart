import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  const ClinicCard({super.key,required this.image,required this.name,required this.pio});
  final String ?image;
  final String ?name;
  final String ?pio;
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (context,constraints) {
          return constraints.maxWidth < 600?Container(
            height:150,
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
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:const EdgeInsets.only(right: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20,),
                        Text(name!,style:const TextStyle(
                            color: Colors.black
                        ),textDirection: TextDirection.rtl,),
                        Text(pio!,style: TextStyle(
                            color: Colors.grey.shade400
                        ),textDirection: TextDirection.rtl,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ) :Container(
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
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:const EdgeInsets.only(right: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20,),
                       Text(name!,style:const TextStyle(
                          color: Colors.black
                      ),textDirection: TextDirection.rtl,),
                      Text(pio!,style: TextStyle(
                          color: Colors.grey.shade400
                      ),textDirection: TextDirection.rtl,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
