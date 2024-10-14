import 'package:confirt_care/pressintation/Docotors/Cubit/doctors_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../pressintation/Docotors/Cubit/doctors_cubit.dart';
import 'Cubit/doctors_cubit.dart';
import 'Model/Booking.dart';

class BookingAdminScreen extends StatelessWidget {
  final String Name;

  const BookingAdminScreen({Key? key, required this.Name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorAdminCubit cubit = DoctorAdminCubit.get(context);
    cubit.fetchDoctorData();
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DoctorAdminCubit, DoctorsAdminState>(
        builder: (context, state) {
          if (state is DoctorsClincLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (cubit.Book.isEmpty) {
              return Center(child: Text('No bookings found.'));
            }
            return ListView.builder(
              itemCount: cubit.Book.length,
              itemBuilder: (context, index) {
                print(cubit.Book);
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Customer Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Name: ${cubit.Book[index]["DoctorName"]}"),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                      // Customer Phone
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Phone: ${cubit.Book[index]["Phonenumber"] != null && cubit.Book[index]["Phonenumber"].isNotEmpty ? cubit.Book[index]["Phonenumber"] : 'لا يوجد رقم هاتف لهذا العميل'}"),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                      // Doctor Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Doctor: ${cubit.Book[index]["DoctorName"]}'),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text("Date: ${DateFormat('EEE, MMM d, yyyy HH:mm').format(cubit.Book[index]["Date"].toDate())}"),
                );
              },
              // separatorBuilder: (BuildContext context, int index) {
              //   return Divider();
              // },
            );
          }
        },
      ),
    );
  }
}
