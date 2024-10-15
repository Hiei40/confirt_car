import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctors_state.dart';
class DoctorAdminCubit extends Cubit<DoctorsAdminState> {
  DoctorAdminCubit() : super(DoctorsInitial());
  static DoctorAdminCubit get(context) => BlocProvider.of(context);
  List Book = [];
  fetchDoctorData() async {
    emit(DoctorsClincLoading());
    Book.clear();
    await  FirebaseFirestore.instance.collectionGroup("Booking").get().
    then((v){
      v.docs.forEach((index){
        Book.add(index.data());
        print("is booking $Book");
      });
    });
    emit(DoctorsClincSuccful());
  }
}