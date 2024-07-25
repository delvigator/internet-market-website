import 'package:exdevs/pages/home/home_page.dart';
import 'package:exdevs/routes.dart';
import 'package:exdevs/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Market',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: theme(),
      home:  const HomePage(),
    );
  }
}


