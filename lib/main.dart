import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist/Pages/home.dart';
import 'package:wishlist/Provider/taskProvider.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (context) => TaskProvider(),child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
