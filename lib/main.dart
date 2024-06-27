import 'package:comfirt_carr_admin/pressintation/Docotors/Cubit/doctors_cubit.dart';
import 'package:comfirt_carr_admin/pressintation/auth/cubit/cubit.dart';
import 'package:comfirt_carr_admin/pressintation/auth/screen/login.dart';
import 'package:comfirt_carr_admin/pressintation/auth/screen/sign_up.dart';
import 'package:comfirt_carr_admin/pressintation/home_bage/Home.dart';
import 'package:comfirt_carr_admin/pressintation/home_bage/cubit/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ClincsCubit()),
        BlocProvider(create: (context) => DoctorsCubit()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        routes: {
          "Login":(context)=>LoginScreen(),
          "Signup":(context)=>SignUpScreen(),
          "Home":(context)=>Home()


        },
      ),
    );
  }
}
