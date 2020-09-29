import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/data.dart';
import 'package:http/http.dart' as http;
import '../constants/api.dart';

class DataProvider with ChangeNotifier {
  List<Data> _items = [];

  List<Data> get items {
    return [..._items];
  }

  Future<void> fetchAndSetData() async {
    try {
      print('hello');
      final resopnse = await http.get(Api.API);
      // print(resopnse.body);
      final extractedData = json.decode(resopnse.body)['rates'] as dynamic;
      print(extractedData);
      List<Data> loadedData = [];
      extractedData.forEach((key, value) {
        loadedData.add(
          Data(
            name: key,
            value: value.toString(),
          ),
        );
      });
      _items = loadedData;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
