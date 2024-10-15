import 'package:flutter/material.dart';

import '../../../doctor/all_doctors.dart';
import '../../../doctor/doctor_category.dart';
class DropDownTypeList extends StatelessWidget {
  final List<String>? list;
  final fun;
  final double? width;
  final String clinc;
  final String title;
  const DropDownTypeList({
    super.key,
    required this.list,
    required this.fun,
    required this.width,
    required this.clinc,
    required this.title
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width!,
      decoration: BoxDecoration(
        border: Border.all(width: .8,        color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(fun.category),
        // value: fun.userType,
        padding: const EdgeInsets.only(left: 20),
        underline: const SizedBox(
          height: 0,
          width: 0,
        ),
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? value) {
          fun.filtterList(value!,clinc);
          if(value=="الكل"){
           Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                AllDoctors(Clinic:clinc,title:title )
           ));}else{
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AllDoctorsCategory(Clinic: clinc, Category: fun.category,title: title,),
            ));
          }
        },
        items: list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}