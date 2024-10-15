import 'package:confirt_care/pressintation/Docotors/BookingScreen.dart';
import 'package:confirt_care/pressintation/blog/blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Docotors/Docotors.dart';
import 'Model/Clinc_Model.dart';
import 'Widgets/ClincsContainer.dart';
import 'cubit/cubit.dart';
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Blogs()
                ));
            },
            child: Text("blogs"),
          )
        ],
      ),
      body: BlocBuilder<ClincsCubit, ClincsState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(
                itemCount: cubit.Clinc.length,
                itemBuilder: (context, index) {
                  Clinics clinics = cubit.Clinc[index];
                  cubit.id;
                  print(cubit.id[index]);
                  return ClincsContainer2(
                    photoUrl: clinics.photo,
                    ClincName: clinics.name,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingScreen(
                                  Name: "",
                                )),
                      );
                    },
                    id: '',
                  );
                }),
          );
        },
      ),
    );
  }
}
