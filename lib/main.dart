import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/adapters/favourite_adapter.dart';
import 'Module/Home/view/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(FavouriteAdapter());
  await Hive.openBox('Favourites');
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// 46d6718883903f0428e3c06cd4c38c12  api  v3

// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NmQ2NzE4ODgzOTAzZjA0MjhlM2MwNmNkNGMzOGMxMiIsInN1YiI6IjYxNDcxMzM4YzI4MjNhMDA0NGRjY2RlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m3UipJDQ4PKSIh-faz1DmPNXu-wAFQVrA8HGotG3FYg  v4
