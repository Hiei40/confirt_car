import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/Clinc_Model.dart';
import 'state.dart';
//     "Insurance",
//     "Ministry of Interior",
class ClincsCubit extends Cubit<ClincsState> {
  ClincsCubit() : super(InitMainState());
  static ClincsCubit get(context) => BlocProvider.of(context);
  List profileId=[];
  List profile=[];
  List requestData=[];
  List requestId=[];
  String update="";
  Map<String,dynamic>myProfile={};
  List<Clinics> Clinc= [];
  List id=["bu_cdimy","Beautyclinicacademy","comfrt_care","slmtk"];
  fetchClincData() async {

    try {
      Clinc.clear();
      emit(ClinicLoadinState());
      //
      // Fetch data from Firestore
      CollectionReference ClinicData =
      FirebaseFirestore.instance.collection("clinics");
      QuerySnapshot ClinicInfo =
      await ClinicData.orderBy("Name", descending: false).get();
      Clinc.clear();

      ClinicInfo.docs.forEach((element) {
        Clinc.add(Clinics.fromJson(element.data()as Map<String, dynamic>));
      });

      emit(ClinicSuccfulState());

    }
    catch (e) {
      // Emit error state if any exception occurs
      emit(ClinicErrorState(Error: "Failed to load data: $e"));
    }
  }



  getProfile()async{
    await FirebaseFirestore.instance.collection("Profile").where("userType",isEqualTo: null).get().then((value) {
      profileId=[];
      profile=[];
      value.docs.forEach((element) {
        if(element.data()["userType"]==null){
        profile.add(element.data());
        profileId.add(element.id);}
      });
    });
    emit(ProfileState());
  }
  getMyProfile()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      myProfile=value.data()!;
    });
    emit(MyProfileState());
  }


}