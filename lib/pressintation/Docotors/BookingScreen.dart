import 'package:comfirt_carr_admin/pressintation/Docotors/Cubit/doctors_cubit.dart';
import 'package:comfirt_carr_admin/pressintation/Docotors/Model/Booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  final String Name;

  const BookingScreen({Key? key, required this.Name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorsCubit cubit = DoctorsCubit.get(context);
    cubit.fetchCollectionGroupData(Name);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          if (state is CollectionGroupDataLoading) {
            return Center(child: CircularProgressIndicator());
          }  else {
            if (cubit.Book.isEmpty) {
              return Center(child: Text('No bookings found.'));
            }
            return ListView.separated(
              itemCount: cubit.Book.length,
              itemBuilder: (context, index) {
                Booking booking = cubit.Book[index];
                print(booking.doctorName!);
                return ListTile(
                  title: Text(booking.doctorName!),
                  subtitle: Text('Doctor: ${booking.doctorName}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          }
        },
      ),
    );
  }
}
