import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hits extends StatefulWidget {
  const Hits({super.key});

  @override
  State<Hits> createState() => _HitsState();
}

class _HitsState extends State<Hits> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text(
            "Хиты продаж",style: Theme.of(context).textTheme.titleMedium,
          ), const SizedBox(width: 20,),
            GestureDetector(
              onTap: (){},
              child: Text("Смотреть все",style: Theme.of(context).textTheme.titleSmall,)),
            ],)
        ],
      ),
    );
  }
}
