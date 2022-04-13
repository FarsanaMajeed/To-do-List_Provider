
import 'package:flutter/material.dart';
import 'package:toddo_provider/model/notes_provider.dart';
import 'package:toddo_provider/screens/Home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(create: (context)=> NotesProvider(),
      child:MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomePage() ,
      ),
    );
  }
}


