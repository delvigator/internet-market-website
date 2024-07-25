import 'package:exdevs/bloc/information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../components/product_card.dart';
import '../../global_vars.dart';

class Hits extends StatefulWidget {
  const Hits({super.key});

  @override
  State<Hits> createState() => _HitsState();
}

class _HitsState extends State<Hits> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Хиты продаж",
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
              ],
            ),
          ),
          BlocBuilder<InformationBloc, InformationState>(
            bloc: bloc,
            builder: (BuildContext context, InformationState state) {
              return LayoutGrid(areas: '''
            0 0 1 3 6 6
            0 0 2 4 5 7
            ''', columnSizes: [
                200.px,
                200.px,
                200.px,
                200.px,
                200.px,
                200.px
              ], rowSizes: [
                210.px,
                210.px
              ],
                  columnGap: 12,
                  rowGap: 12,
                  children: bloc.state.products.asMap().entries.map((unit) =>bloc.state.products.isEmpty ? const Center(child: CircularProgressIndicator())
                      : ProductCard( product: unit.value ).inGridArea(unit.key.toString())).toList());
            },
          )
        ],
      ),
    );
  }
}
