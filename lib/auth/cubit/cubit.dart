import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirt_care/auth/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool emailVerified = false;
  String? a;
  String? b;
  String? c;
  bool obscureText = true;
  List list = [];
  Map profileMap={};
  String emilv = "";
  String emaile = "";
  String passe = "";
  SignInWithEamilandPass(email, pass) async {
    print(email);
    print(pass);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
      if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      emaile = "user not found";
      passe = "Wrong password provided for that user";
      print(e.code);
    }
    emit(SuccessState());
  }


  SignupWithEmailandpass(email, pass, name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        sendData(value.user!.uid, email, name);
      });
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emilv = "email already exist";
      }
      log(e as String);
    }
    emit(SignUpState());
  }
  sendData(uid, email, name) async {
    await FirebaseFirestore.instance.collection("Profile").doc(uid).set({
      "email": email,
      "name": name,
    });
    emit(SetDataState());
  }
  checkVal1(val) async {
    if (list.length < 2) {
      b = val;
      list.add(val);
    }
    emit(Check1State());
  }

  checkVal2(val) async {
    if (list.length < 2) {
      c = val;
      list.add(val);
    }
    emit(Check2State());
  }
  profile()async{
  await  FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      profileMap=value.data()!;
    });
    print(profileMap);
    emit(ProfileState());
  }




}




