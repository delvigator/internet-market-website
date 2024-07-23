import 'package:exdevs/components/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
        child: Column(
          children: [
            Header(),
            Hits()
          ],
        ),
      ),
    );
  }
}
