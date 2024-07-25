import 'dart:convert';

import 'package:exdevs/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';

part 'information_event.dart';

part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InformationState()) {
    on<LoadDataEvent>(_onLoadDataEvent);
    on<ChangeCurrentProductEvent>(_onChangeCurrentProductEvent);
  }

  _onChangeCurrentProductEvent(ChangeCurrentProductEvent event, Emitter<InformationState> emit){
    emit(state.copyWith(currentProduct: event.product));
    saveInfo();
  }

  _onLoadDataEvent(LoadDataEvent event, Emitter<InformationState> emit) async {
    String data = await DefaultAssetBundle.of(event.context!)
        .loadString("assets/json/products.json");
    final result = jsonDecode(data);
    List<Product> products = List<Product>.generate(
        result.length, (index) => Product.fromJson(result[index]));

    emit(state.copyWith(products: products));
  }
}
