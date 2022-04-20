
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toddo_provider/logic/view_models/authentication.dart';
import 'package:toddo_provider/model/services/notes_provider.dart';
import 'package:toddo_provider/screens/Home_page.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> NotesProvider(),),
      ChangeNotifierProvider(create: (context)=>Authentication(),)
      ],
      child:MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomePage() ,
      ),
    );
  }
}


