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
  List days=[];
List dateTimes=[];
  List Time=[];
  List allDoctorCategoryList=[];
  List DocotorsCategoryId=[];
  List <String> categoryList=[
    "الكل",
    'جلدية ',
    "تخسيس وتغذيه ",
    'نسا وتوليد ',
    'اورام ',
    'جراحة اوعية ',
    'انف واذن وحنجره ',
    'جهاز هضمى ومناظي ',
'جراحه المخ والاعصاب ',
    'عظام ',
    'باطنه ',
    'سكر وغدد صماء ',
    'انف واذن وحنجره ',
    'اورام ',
    'عظام ',
    'ممارس عام ',
    'باطنه ',
    'ذكورة وعقم ',
    'اطفال وحديث الولادة ',
    'نسا وتوليد ',
    'قلب واوعيه ',
    'علاج علاج الالم  ',
    "جراحة الاورام ",
    'جلدية ',
    'كلى ',
    'روماتيزم ',
  ];
  String category="التخصص";
  filtterList(value, Clinc){
    category=value;
    emit(CategoryDrobDownState());
  }
  profile()async{
   await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      profileMap=value.data()!;
    });
   print(profileMap);
    emit(ProfileState());
  }
  List datedoctor=[];
  allDoctors(String Clinic) async {
    emit(loadingState());
    allDoctorList.clear();
    DocotorsId.clear();
    datedoctor.clear();  // Clear the datedoctor list before adding new data

    await FirebaseFirestore.instance
        .collection("clinics")
        .doc(Clinic)
        .collection("dd")
        .get()
        .then((value) {
      value.docs.forEach((v) {
        DocotorsId.add(v.id);

        // Check if the Bookingdate field exists and process it
        if (v.data()["Bookingdate"] != null) {
          var bookingDates = v.data()["Bookingdate"];

          // Iterate through each booking and treat date as a string
          bookingDates.forEach((booking) {
            if (booking["date"] != null && booking["date"] is String) {
              // Since the date is already a string, just add it to the list
              datedoctor.add(booking["date"]);
            }
          });
          bookingDates.forEach((booking) {
            if (booking["Time"] != null && booking["Time"] is String) {
              // Since the date is already a string, just add it to the list
              datedoctor.add(booking["date"]);
            }
          });
          bookingDates.forEach((booking) {
            if (booking["day"] != null && booking["day"] is String) {
              // Since the date is already a string, just add it to the list
              datedoctor.add(booking["date"]);
            }
          });
        }

        allDoctorList.add(v.data());
      });
    });

    print("Doctor IDs: $DocotorsId");
    print("Booking Dates: $datedoctor");
    emit(AllDoctorState());
  }
  allDoctorsCategory(String Clinic,type)async{
    emit(loadingState());
    allDoctorCategoryList.clear();
    DocotorsCategoryId.clear();
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic)
        .collection("dd").where("type",isEqualTo:type ).get().then((value){
      value.docs.forEach((v){
        if(v["type"]==type){
        DocotorsCategoryId.add(v.id);
        allDoctorCategoryList.add(v.data());
        }
      });
    });
    print(allDoctorCategoryList);
    emit(AllDoctorCategoryState());
  }
  doctors()async{
    emit(loadingState());
    await FirebaseFirestore.instance
        .collection("clinics").doc("slmtk").
    collection("dd").doc("4mgQvgVSIQRIoKGg8uxbUykMH6t1").get().then((value){
      doctorMap=value.data()!;
    });
    print(allDoctorList);
    emit(DoctorState());
  }

  doctorsFetch(String Name,String Clinic, String Doctor,Map <String,dynamic>map)async{
    emit(loadingState());
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic).collection("dd").doc(Doctor).collection("Booking").add(map);

    print(allDoctorList);
    emit(DoctorState());
  }
  doctorData(String Clinic, String Doctor) async {
    emit(DoctorLoadingState());
    days = [];
    dateTimes = [];
    Time=[];


    await FirebaseFirestore.instance
        .collection("clinics")
        .doc(Clinic)
        .collection("dd")
        .doc(Doctor)
        .get()
        .then((v) {
      doctorMap = v.data()!;

      if (v.data() != null && v.data()!["Bookingdate"] != null) {
        var bookingDates = v.data()!["Bookingdate"];
        // Ensure that the "Bookingdate" is a list of maps
        bookingDates.forEach((booking) {
          if (booking["date"] != null) {
            days.add(booking["date"]);
          }
          if (booking["Time"] != null) {
            dateTimes.add(booking["Time"]);
          }
          if (booking["day"] != null) {
            Time.add(booking["day"]);
          }
        });
      }
      print("Days: $days");
      print("DateTimes: $dateTimes");
    });

    emit(DoctorDataState());
  }
  searchCubit(search)async{
    emit(EmptyState());
    if(search==""){
      searchList=[];
    }else{
      await FirebaseFirestore.instance.collectionGroup("dd")
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
    await FirebaseFirestore.instance.collection("clinics").doc(Clinic).collection("dd").where("name",isEqualTo: Name).get().then((value){
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




