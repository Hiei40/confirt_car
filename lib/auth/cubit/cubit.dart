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
  Map profileMap={};
  String emilv = "";
  String emaile = "";
  String passe = "";
  SignInWithEamilandPass(email, pass) async {
    print(email);
    print(pass);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    emit(SuccessState());
  }


  SignupWithEmailandpass(emailAddress, password,name,) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      sendData(FirebaseAuth.instance.currentUser!.uid,emailAddress,name);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
  // checkVal1(val) async {
  //   if (list.length < 2) {
  //     b = val;
  //     list.add(val);
  //   }
  //   emit(Check1State());
  // }
  //
  // checkVal2(val) async {
  //   if (list.length < 2) {
  //     c = val;
  //     list.add(val);
  //   }
  //   emit(Check2State());
  // }
  profile()async{
  await  FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      profileMap=value.data()!;
    });
    print(profileMap);
    emit(ProfileState());
  }




}




