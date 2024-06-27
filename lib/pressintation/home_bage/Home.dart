import 'package:comfirt_carr_admin/pressintation/Docotors/Docotors.dart';
import 'package:comfirt_carr_admin/pressintation/home_bage/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/Clinc_Model.dart';
import 'Widgets/ClincsContainer.dart';
import 'cubit/state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ClincsCubit cubit = ClincsCubit.get(context);
    cubit.fetchClincData();
cubit.id;

    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),

      body: BlocBuilder<ClincsCubit, ClincsState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(itemCount: cubit.Clinc.length, itemBuilder: (context, index) {
              Clinics clinics=cubit.Clinc[index];
              cubit.id;
print(cubit.id[index]);
              return ClincsContainer2(

                photoUrl: clinics.photo, ClincName: clinics.name, onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) =>  Docotors(id: cubit.id[index], Name: clinics.name,)), );
              }, id: '',
              );
            }),
          );
        },
      ),
    );
  }
}
