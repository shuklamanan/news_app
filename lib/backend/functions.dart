import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/utils/api/key.dart';
import 'package:news_app/components/searchbar.dart';

Future<List> fetchNews(String text) async {
  if (text == "") {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${key.keys}&q=${SerchBar.searchcntrl.text}'));
    Map result = jsonDecode(response.body);
    // print(result['articles']);
    return (result['articles']);
  }
  if (text == "Popular") {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$text&sortBy=popularity&pageSize=100&apiKey=${key.keys}&q=${SerchBar.searchcntrl.text}'));
    Map result = jsonDecode(response.body);
    return (result['articles']);
  }
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=$text&pageSize=100&apiKey=${key.keys}&q=${SerchBar.searchcntrl.text}'));
  Map result = jsonDecode(response.body);
  return (result['articles']);
}
