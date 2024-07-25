import 'package:exdevs/components/our_colors.dart';
import 'package:exdevs/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/information_bloc.dart';
import '../../global_vars.dart';

class NewItems extends StatefulWidget {
  const NewItems({super.key});

  @override
  State<NewItems> createState() => _NewItemsState();
}

class _NewItemsState extends State<NewItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column( children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Лучшие новинки",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Смотреть все",
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              const SizedBox(width: 920,),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OurColors.focusColor,),
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.arrow_back),
                      )),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OurColors.focusColor,),
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        BlocBuilder<InformationBloc, InformationState>(
            bloc: bloc,
            builder: (BuildContext context, InformationState state) {
            return Row(
              children: bloc.state.products.asMap().entries.map((element)=>element.key<5 ? Container(
                height: 300,
                width: 257,
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: ProductCard( product: element.value,),
              ): Container()).toList()
            );
          }
        )
      ]),
    );
  }
}
