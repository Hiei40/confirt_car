import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfirt_carr_admin/pressintation/auth/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthMainState> {
  AuthCubit() : super(AuthInitState());

  String userType = "Admin";

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool hidePasse = false;

  void hidePass() {
    hidePasse = !hidePasse;
    emit(HidePasswordState());
  }

  Future<void> signInCubit(String emailAddress, String password, BuildContext context) async {
    emit(EmptyLoginState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(LoginSuccful());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInStateError(Error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInStateError(Error: 'Wrong password provided for that user.'));
      } else {
        emit(SignInStateError(Error: e.toString()));
      }
    }
  }

  void dropDownSubCategory(String value) {
    userType = value;
    print(userType);
    emit(DropDownSubCategory());
  }

  Future<void> signUpCubit(String emailAddress, String password, String name) async {
    emit(EmptyLoginState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateProfile(displayName: name);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        await createProf(user!.uid, name, userType, emailAddress);

        emit(SignUpState());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignInStateError(Error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignInStateError(Error: 'The account already exists for that email.'));
      } else {
        emit(SignInStateError(Error: e.toString()));
      }
    } catch (e) {
      emit(SignInStateError(Error: e.toString()));
    }
  }

  Future<void> createProf(String uid, String name, String userType, String emailAddress) async {
    try {
      await FirebaseFirestore.instance.collection("Profile").doc(uid).set({
        "name": name,
        "userType": userType,
        "email": emailAddress,
      });
      print("Profile created successfully");
    } catch (e) {
      print("Error creating profile: $e");
    }
  }
}
