import 'package:exdevs/bloc/information_bloc.dart';
import 'package:exdevs/components/header.dart';
import 'package:exdevs/global_vars.dart';
import 'package:exdevs/pages/home/new_items.dart';
import 'package:flutter/material.dart';

import 'hits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      bloc.add(LoadDataEvent(context));
    });

  }
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: const Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  Hits(),
                  NewItems()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
