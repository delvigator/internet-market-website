import 'dart:ui';

import 'package:exdevs/bloc/information_bloc.dart';
import 'package:exdevs/components/our_colors.dart';
import 'package:exdevs/global_vars.dart';
import 'package:exdevs/pages/product/product_info.dart';
import 'package:exdevs/shared_prefs.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bloc.add(ChangeCurrentProductEvent(product));
        Navigator.of(context).pushNamed(
            ProductInfo.routeName);
      },
      child: Stack(textDirection: TextDirection.ltr, children: [
        Positioned(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final height = constraints.maxHeight;
            double fontSize = 10;
            if (height > 400) fontSize = 14;
            return Card(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: constraints.biggest.width * 50,
                      height: constraints.biggest.height * .70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                product.card,
                              ),
                              fit: BoxFit.fill))),
                  Container(
                    padding: EdgeInsets.only(
                        top: constraints.biggest.height * .03,
                        bottom: 0,
                        left: height > 400 ? 20 : 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: fontSize)),
                        Text(product.category,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: fontSize)),
                        Text(product.price,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: fontSize)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )),
        Positioned(
          top: 10,
          left: 10,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
                decoration: BoxDecoration(
                    color: OurColors.focusColor,
                    borderRadius: BorderRadius.circular(10)),
                width: 40,
                height: 26,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(product.rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 10)),
                      const Icon(
                        Icons.star,
                        size: 10,
                      )
                    ],
                  ),
                ));
          }),
        ),
      ]),
    );
  }
}
