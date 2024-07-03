import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirt_care/doctor/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<MainDoctorState> {
  DoctorCubit() : super(initialState());

  static DoctorCubit get(context) => BlocProvider.of(context);
  Map profileMap={};
  Map doctorMap={};
  Map DoctorData={};
List searchList=[];
List DoctorSearch=[];
  List allDoctorList=[];
  List DocotorsId=[];
  profile()async{
   await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      profileMap=value.data()!;
    });
   print(profileMap);
    emit(ProfileState());
  }
  allDoctors(String Clinic)async{
    emit(loadingState());
    allDoctorList.clear();
    DocotorsId.clear();
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic).collection("doctors").get().then((value){
     value.docs.forEach((v){
       DocotorsId.add(v.id);

       allDoctorList.add(v.data());
     });
    });
    print(allDoctorList);
    emit(AllDoctorState());
  }
  doctors()async{
    emit(loadingState());
    await FirebaseFirestore.instance
        .collection("clinics").doc("slmtk").
    collection("doctors").doc("4mgQvgVSIQRIoKGg8uxbUykMH6t1").get().then((value){
      doctorMap=value.data()!;
    });
    print(allDoctorList);
    emit(DoctorState());
  }

  doctorsFetch(String Name,String Clinic, String Doctor,Map <String,dynamic>map)async{
    emit(loadingState());
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic).collection("doctors").doc(Doctor).collection("Booking").add(map);

    print(allDoctorList);
    emit(DoctorState());
  }
  searchCubit(search)async{
    emit(EmptyState());
    if(search==""){
      searchList=[];
    }else{
      await FirebaseFirestore.instance.collectionGroup("doctors")
          .orderBy("name").startAt([search]).endAt([search + "\uf8ff"]).get().then((value) {
        searchList=[];
        value.docs.forEach((element) {
          searchList.add(element.data()["name"]);
        });
      });}
    print(searchList.toString());

    emit(GetShopData());
  }
  SearchDoctors(String Clinic,String Name)async{
    emit(loadingState());
    DoctorSearch.clear();
    DocotorsId.clear();
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic).collection("doctors").where("name",isEqualTo: Name).get().then((value){
      value.docs.forEach((v){
      if(Name==v["name"])
        DocotorsId.add(v.id);
        DoctorSearch.add(v.data());

      });
    });
    print(DoctorSearch);
    emit(SearchDoctorState());
  }

}




