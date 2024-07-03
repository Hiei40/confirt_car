import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_bage/Widgets/ClincsContainer.dart';
import 'BookingScreen.dart';
import 'Cubit/doctors_cubit.dart';
import 'Model/Doctor_model.dart';

class Docotors extends StatelessWidget {
  const Docotors({super.key, required this.id, required this.Name});
final String id;
final String Name;
  @override
  Widget build(BuildContext context) {
    DoctorsCubit cubit = DoctorsCubit.get(context);
cubit.fetchDoctorData( id);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(
              itemCount: cubit.doctorList.length,
              itemBuilder: (context, index) {
                Doctors doctor = cubit.doctorList[index];
                return ClincsContainer2(
                  photoUrl:doctor.image!,
                  ClincName: doctor.name!,
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) =>  BookingScreen(Name: doctor.name!,)), );
                    }, id:cubit.idList[index].id!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
