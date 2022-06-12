import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:primenumbertask/EmailAuthenticate/startPage.dart';
import 'package:primenumbertask/homeScreen.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialiserWidget(),
    );
  }
}