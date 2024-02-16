import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/key.dart';
import 'package:news_app/components/searchbar.dart';

Future<List> fetchnews(String text) async {
  if (text == "") {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=' +
            key.keys +
            '&q=' +
            SerchBar.searchcntrl.text));
    Map result = jsonDecode(response.body);
    return (result['articles']);
  }
  if (text == "Popular") {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=${text}&sortBy=popularity&pageSize=100&apiKey=' +
            key.keys +
            '&q=' +
            SerchBar.searchcntrl.text));
    Map result = jsonDecode(response.body);
    return (result['articles']);
  }
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=${text}&pageSize=100&apiKey=' +
          key.keys +
          '&q=' +
          SerchBar.searchcntrl.text));
  Map result = jsonDecode(response.body);
  return (result['articles']);
}
