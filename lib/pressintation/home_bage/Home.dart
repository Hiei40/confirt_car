import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Docotors/BookingScreen.dart';
import '../../Docotors/Docotors.dart';
import '../Docotors/BookingScreen.dart';
import 'Model/Clinc_Model.dart';
import 'Widgets/ClincsContainer.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    ClincsCubit cubit = ClincsCubit.get(context);
    cubit.fetchClincData();
    cubit.id;
    return Scaffold(
      appBar: AppBar(
        leading: Text("HomeScreen"),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<ClincsCubit, ClincsState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(
                itemCount: cubit.Clinc.length,
                itemBuilder: (context, index) {
                  cubit.id;
                  print(cubit.id[index]);
                  return ClincsContainer2(
                    photoUrl: cubit.Clinc[index]["image"],
                    ClincName: cubit.Clinc[index]["name"],
                    onTap: () {
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) =>
                            BookingScreen(Name: "",)), );                    },
                    id: '',
                  );
                }),
          );
        },
      ),
    );
  }
}
