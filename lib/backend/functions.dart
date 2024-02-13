import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/key.dart';
import 'package:news_app/components/searchbar.dart';

Future<List> fetchnews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=' +
          key.keys +
          '&q=' +
          SerchBar.searchcntrl.text));
  Map result = jsonDecode(response.body);
  print('fetched');
  return (result['articles']);
}
