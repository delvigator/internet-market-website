import 'package:exdevs/bloc/information_bloc.dart';
import 'package:exdevs/components/our_colors.dart';
import 'package:exdevs/models/product.dart';
import 'package:exdevs/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

import '../../components/default_button.dart';
import '../../components/header.dart';
import '../../global_vars.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  static String routeName = "/productInfo";

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  void initState() {
    super.initState();
    if (bloc.state.currentProduct == null) readInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (bloc.state.currentProduct == null) readInfo();
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Scaffold(
          body: bloc.state.currentProduct == null
              ? const Center(child: CircularProgressIndicator())
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Header(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: wayToPage(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: mainInfo(),
                          ),

                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: photos(),
                              ),
                              Positioned(
                                top:250,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: OurColors.focusColor,),
                                          width: 40,
                                          height: 40,
                                          child: const Icon(Icons.arrow_back),
                                        )),
                                    const SizedBox(width: 680,),
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
                                ),
                              ),
                              Positioned(
                                top: 445,
                                left: 400,
                                child: Container(
                                  width: 200,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: OurColors.focusColorDark),
                                      borderRadius: BorderRadius.circular(20)),child: const Center(child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("Подробнее"),Icon(Icons.keyboard_arrow_down)],)),),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30.0),
                                child: description(),
                              ),
                              const SizedBox(width: 100,),
                              rating()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
        ));
  }

  Widget wayToPage() {
    TextStyle? textStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontWeight: FontWeight.bold);
    return BlocBuilder<InformationBloc, InformationState>(
      bloc: bloc,
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "Каталог",
              style: textStyle,
            ),
            Text(
              " — ",
              style: textStyle,
            ),
            Text(
              bloc.state.currentProduct!.category,
              style: textStyle,
            ),
            Text(
              " — ",
              style: textStyle,
            ),
            Text(
              bloc.state.currentProduct!.name,
              style: textStyle,
            ),
          ],
        );
      },
    );
  }

  Widget mainInfo() {
    return BlocBuilder<InformationBloc, InformationState>(
        bloc: bloc,
        builder: (context, state) {
          Product? product = bloc.state.currentProduct;
          return Container(
            decoration: const BoxDecoration(color: OurColors.focusColor),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                       ),
                    child: Image.network(product!.card,fit: BoxFit.fill,),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 122,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        product.category,
                        style: const TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 550,
                ),
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: [
                    const SizedBox(
                        width: 200,
                        height: 40,
                        child: DefaultButton(
                          text: 'Добавить в желаемое',
                          borderColor: OurColors.focusColorDark,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: 200,
                        height: 40,
                        child: DefaultButton(
                          text: 'Купить ${product.price}',
                          primaryColor: Colors.black,
                          textColor: Colors.white,
                        ))
                  ]),
                )
              ],
            ),
          );
        });
  }

  Widget photos() {
    return BlocBuilder<InformationBloc, InformationState>(
      bloc: bloc,
      builder: (context, state) {
        Product? product=bloc.state.currentProduct;
        return Stack(children: [
          LayoutGrid(
            columnSizes: [
              230.px,
              230.px,
              240.px,
              250.px,
              250.px,
            ],
            rowSizes: [
              150.px,
              150.px,
              150.px,
            ],
            columnGap: 12,
            rowGap: 12,
            areas: '''
         0 0 0 1 2
         0 0 0 3 4
         0 0 0 5 6
          ''',
            children: product!.photos.asMap().entries.map((unit) => SizedBox.expand(
              child:
                Image.network(unit.value,fit: BoxFit.fill,),

            ).inGridArea(unit.key.toString())).toList()),

        ]);
      },
    );
  }

  Widget description(){
    return BlocBuilder<InformationBloc, InformationState>(
      bloc: bloc,
  builder: (context, state) {
        Product? product=bloc.state.currentProduct;
    return Container(
      width: 735,
      height: 200,
      color: OurColors.focusColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        Text("Описание товара",style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 10,),
        Expanded(child: Text(product!.description))
                ],
              ),
      ),
    );
  },
);
  }
  
  Widget rating(){
    return BlocBuilder<InformationBloc, InformationState>(
      bloc:bloc,
  builder: (context, state) {
    return Column(
      children: [
        const Row(children: [
          Text("Общий рейтинг",style: TextStyle(fontSize: 20)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Tooltip(
              message: "Это подсказка",
              child: Icon(
                Icons.help,
                color: OurColors.focusColorDark,
                size: 20,
              ),
            ),
          )
        ],),
        Row(
          children: [
            Text(bloc.state.currentProduct!.rating.toString(),style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 40),),
            const SizedBox(width: 10,),
            RatingStars(rating: bloc.state.currentProduct!.rating, editable: true,color: OurColors.focusColorDark,iconSize: 60,)
          ],
        ),
      ],
    );
  },
);
  }
}
