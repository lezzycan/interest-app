import 'dart:convert';

import 'package:interest_app/models/items.dart';
import 'package:stacked/stacked.dart';
import "package:flutter/services.dart" as base;

class HomeViewModel extends BaseViewModel {
  List<ItemsModel> item = [];

  Future<List<dynamic>> readJsonData() async {
    setBusy(true);
    final jsonData =
        await base.rootBundle.loadString('jsonFile/listOfItems.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    item = list.map((e) => ItemsModel.fromJson(e)).toList();
    setBusy(false);
    return item;
  }

  void deleteTask(int index){
    item.removeAt(index);
    notifyListeners();
  }
}
