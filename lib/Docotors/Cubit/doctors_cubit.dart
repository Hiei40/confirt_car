import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/Booking.dart';
import '../Model/Doctor_model.dart';
import 'doctors_state.dart';


class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());
  static DoctorsCubit get(context) => BlocProvider.of(context);

  List<Doctors> doctorList = [];
  List<Doctors> idList = [];
  List Book = [];
  fetchDoctorData() async {
      emit(DoctorsClincLoading());
      await  FirebaseFirestore.instance.collectionGroup("Booking").get().then((v){
         v.docs.forEach((index){
           Book.add(index.data());
         });
       });
      emit(DoctorsClincSuccful());
  }
  fetchCollectionGroupData(String Name) async {
  print(Name);
      Book.clear();
      emit(CollectionGroupDataLoading());

      // Correct way to create a query to fetch data
      QuerySnapshot<Map<String, dynamic>> BookingInfo = await FirebaseFirestore.instance
          .collectionGroup('Booking')
          .get();



      // Clear the Book list before populating it
      Book.clear();

      // Populate the Book list
      BookingInfo.docs.forEach((element) {

        if(element.data()["DoctorName"]==Name){
          print("This Book List ${element.data()}");
          Book.add(Booking.fromJson(element.data() as Map<String, dynamic>));
        }

      });
print("This Book List${Book}");
      emit(CollectionGroupDataSucful());
      // Emit error state if any exception occurs
  print("This Book List${Book[0].doctorName}");

  }

}