import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'Cubit/doctors_cubit.dart';
import 'Model/Booking.dart';

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
          } else {
            if (cubit.Book.isEmpty) {
              return Center(child: Text('No bookings found.'));
            }
            return ListView.separated(
              itemCount: cubit.Book.length,
              itemBuilder: (context, index) {
                Booking booking = cubit.Book[index];
                print(booking.doctorName!);
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Customer Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Name: ${booking.name!}"),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                      // Customer Phone
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Phone: ${booking.phoneNumber != null && booking.phoneNumber!.isNotEmpty ? booking.phoneNumber! : 'لا يوجد رقم هاتف لهذا العميل'}"),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                      // Doctor Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Doctor: ${booking.doctorName}'),
                            SizedBox(height: 8), // Adjust spacing as needed
                          ],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text("Date: ${DateFormat('EEE, MMM d, yyyy HH:mm').format(booking.Date.toDate())}"),
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
