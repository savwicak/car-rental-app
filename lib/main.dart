import 'package:flutter/material.dart';
import 'package:savanna_flutter_wow/presentation/screens/home_screen.dart';
import 'package:savanna_flutter_wow/presentation/screens/retale_car.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter final Demo',
      theme: ThemeData(
        fontFamily: 'SuitRegular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/':(context) => const HomeScreen(carName: 'jeep',),
        'doa':(context) => const RentalCar(),
      },
    );
  }
}