import 'package:confirt_care/doctor/DoctorProfile.dart';
import 'package:confirt_care/doctor/cubit/cubit.dart';
import 'package:confirt_care/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Docotors/Cubit/doctors_cubit.dart';
import 'auth/cubit/cubit.dart';
import 'auth/login_screen.dart';
import 'auth/sign_up.dart';
import 'doctor/all_doctors.dart';
import 'home_bage/cubit/cubit.dart';
import 'main_screen/Contactus.dart';
import 'main_screen/main_bage.dart';
import 'main_screen/about_us_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
        BlocProvider(create: (context)=>DoctorsCubit()),
    BlocProvider(create:(context)=>ClincsCubit()),
      ],
      child: MaterialApp(
        home:  MainPage(),
      ),
    );
  }
}
