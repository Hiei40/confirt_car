import 'package:beamer/beamer.dart';
import 'package:confirt_care/pressintation/Docotors/BookingScreen.dart';
import 'package:confirt_care/pressintation/blog/blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Const/Class PhotoClinics.dart';
import '../Docotors/Docotors.dart';
import '../pressintation/blog/choose_blog.dart';
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
               context.beamToNamed('/main_blogs');
            },
            child: Text("blogs"),
          )
        ],
      ),
      body: BlocBuilder<ClincsCubit, ClincsState>(
        builder: (context, state) {
          return Container(
            child:Column(
          children: [
          ClincsContainer2(
          photoUrl: photoClinics.salamtak,
            ClincName: "عيادة سلامتك",
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
          ),
            ClincsContainer2(
              photoUrl: photoClinics.BeautyClinicAcademy,
              ClincName: "عيادات بيوتي اكاديمي",
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
            ),

          ],
          ),
          );
  }));

}
}
