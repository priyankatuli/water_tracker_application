import 'package:flutter/material.dart';
import 'package:water_tracker_application/home_screen.dart';

void main(){
  runApp(WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget{
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HomeScreen(),
       theme: ThemeData(
         appBarTheme: AppBarTheme(
           centerTitle: true,
           backgroundColor: Colors.purple.shade100,
           foregroundColor: Colors.white,
           elevation: 7
         )
       ),
     );
  }

}