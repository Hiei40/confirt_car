import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfirt_carr_admin/pressintation/Docotors/Model/Booking.dart';
import 'package:comfirt_carr_admin/pressintation/Docotors/Model/Doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());
  static DoctorsCubit get(context) => BlocProvider.of(context);

  List<Doctors> doctorList = [];
  List<Doctors> idList = [];
  List<Booking> Book = [];

  fetchDoctorData(String id) async {
    try {
      emit(DoctorsClincLoading());

      // Fetch data from Firestore
      CollectionReference clinicData = FirebaseFirestore.instance.collection("clinics");
      QuerySnapshot doctorsSnapshot = await clinicData.doc(id).collection("doctors").get();

      // Clear lists before populating
      doctorList.clear();
      idList.clear();

      // Populate lists
      doctorsSnapshot.docs.forEach((DocumentSnapshot document) {
        var data = document.data() as Map<String, dynamic>;
        String id = document.id;
        Doctors doctor = Doctors.fromJson(data);
        doctorList.add(doctor);
        idList.add(Doctors.fromJson({...data, 'id': id}));
      });

      print("ID:${idList[0].id}");

      emit(DoctorsClincSuccful());
    } catch (e) {
      // Emit error state if any exception occurs
      emit(DoctorsClincError(Erorr: "Failed to load data: $e", ));
    }
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