import 'dart:convert';

import 'package:exdevs/bloc/information_bloc.dart';
import 'package:exdevs/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_vars.dart';

Future<void> readInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Product product=Product.fromJson(jsonDecode(prefs.getString("currentProduct")!));
  bloc.add(ChangeCurrentProductEvent(product));
}

void saveInfo() {
  final Map<String, dynamic> map = {
    "currentProduct": jsonEncode(bloc.state.currentProduct),
  };
  savePrefs(map);
}

Future<void> savePrefs(Map<String, dynamic> pairs) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  pairs.forEach((key, value) {
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  });
}
