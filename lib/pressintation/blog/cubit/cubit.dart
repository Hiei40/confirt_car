import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirt_care/pressintation/auth/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogCubit extends Cubit<BlogMainState> {
  BlogCubit() : super(BlogInitState());

  static BlogCubit get(BuildContext context) => BlocProvider.of(context);
  int index=1;
  cont(){
    if(index<=20){
    index+=1;}
    emit(CountState());
  }
}
