import 'package:confirt_care/main_screen/main_bage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bage/Home.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class Layer_check extends StatelessWidget {
  const Layer_check({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit=LoginCubit.get(context);
    cubit.profile();
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      print(cubit.profileMap);
      if(cubit.profileMap.isNotEmpty){
        if (cubit.profileMap["userType"]=="User") {
          return MainPage();
        } else   {
          return Home();
        }}else{
        return MainPage();
      }
    });
  }
}