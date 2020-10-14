import 'package:flutter/material.dart';
import 'package:furn_aldeaa/Screens/enter_adress/enter_adress.dart';
import 'package:furn_aldeaa/Screens/get_started/get_started.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: GetStarted.id,
        routes: {
          GetStarted.id: (context) => GetStarted(),
          EnterAddress.id: (context) => EnterAddress(),
        });
  }
}
