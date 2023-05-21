import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/logic/bloc/cubit.dart';
import 'package:untitled2/logic/bloc/states.dart';
import 'package:untitled2/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit(),
      child: BlocConsumer<cubit , States>(builder: (context , state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: const HomePage(),
        );
      }, listener: (context , state){}),

    );
  }
}
