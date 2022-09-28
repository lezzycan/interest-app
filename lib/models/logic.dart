import 'dart:convert';
import 'dart:core';

import "package:flutter/services.dart" as base;
import 'package:flutter/widgets.dart';
import 'items.dart';

List<ItemsModel> interest = [];

class Logic with ChangeNotifier {
  Future<List<dynamic>> readJsonData() async {
    final jsonData =
        await base.rootBundle.loadString('jsonFile/listOfItems.json');
    final list = jsonDecode(jsonData) as List<dynamic>;
    interest = list.map((e) => ItemsModel.fromJson(e)).toList();
    return interest;
    // ignore: dead_code
    notifyListeners();
  }

//   void deleteTask(ItemsModel task, int index) {

//     interest.removeAt(task,index);
//   }
// }
}
