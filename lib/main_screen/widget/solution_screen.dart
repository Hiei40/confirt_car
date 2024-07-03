import 'package:flutter/material.dart';

class SolutionScreen extends StatelessWidget {
  const SolutionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("free solution",style: TextStyle(
          color: Color(0xFF3559DA),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        const Text("Easy steps for your solution",style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(
          width: 800,
          height: 200,
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c,i){
                return  Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 240,
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          height: 80,
                          width: 80,
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("image/solution_image.jpg"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("search Doctor",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("it's is a long established fact that \n reader will be distracted by the ",
                          style: TextStyle(
                            color: Colors.grey.shade400
                        ),),
                      ],
                    ),
                  ),
                );
              }),)
      ],
    );
  }
}
