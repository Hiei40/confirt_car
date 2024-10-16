import 'package:beamer/beamer.dart';
import 'package:confirt_care/doctor/cubit/cubit.dart';
import 'package:confirt_care/firebase_options.dart';
import 'package:confirt_care/pressintation/Docotors/Cubit/doctors_cubit.dart';
import 'package:confirt_care/pressintation/blog/blogs.dart';
import 'package:confirt_care/pressintation/home_bage/Home.dart';
import 'package:confirt_care/utils/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Docotors/Cubit/doctors_cubit.dart';
import 'auth/cubit/cubit.dart';
import 'auth/login_screen.dart';
import 'home_bage/Home.dart';
import 'home_bage/cubit/cubit.dart';
import 'pressintation/blog/cubit/cubit.dart';

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

    final routerDelegate = BeamerDelegate(
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()],
      ),
      notFoundRedirectNamed: '/',
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
        BlocProvider(create: (context) => DoctorsCubit()),
        BlocProvider(create: (context) => DoctorAdminCubit()),
        BlocProvider(create: (context) => ClincsCubit()),
        BlocProvider(create: (context) => BlogCubit()),
      ],
      // child: MaterialApp.router(
      //   routerDelegate: routerDelegate,
      //   routeInformationParser: BeamerParser(),
      //   debugShowCheckedModeBanner: false,
      //   backButtonDispatcher:
      //   BeamerBackButtonDispatcher(delegate: routerDelegate),
      //
      // ),
      child: MaterialApp(
        home: LoginScreen(),
    debugShowCheckedModeBanner: false,
      ),
    );
  }
}
