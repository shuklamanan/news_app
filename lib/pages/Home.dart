import 'package:flutter/material.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/components/appbar.dart';
import 'package:news_app/components/searchbar.dart';
import 'package:news_app/components/newsbox.dart';
import 'package:news_app/components/top-cat.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    final List arr = [
      'business',
      'entertainment',
      'general',
      'health',
      'science',
      'sports',
      'technology'
    ];
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appcolor.black,
      appBar: appBar(),
      body: Column(children: [
        const SerchBar(),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              filters(text: 'Business'),
              filters(text: 'Entertainment'),
              filters(text: 'General'),
              filters(text: 'Health'),
              filters(text: 'Technology'),
              filters(text: 'Science'),
              filters(text: 'Sports'),
            ],
          ),
        ),
        SizedBox(
          width: w,
          height: 10,
        ),
        Expanded(
          child: Container(
            width: w,
            child: FutureBuilder<List>(
              future: fetchnews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return newsbox(
                            url: snapshot.data![index]['url'],
                            imageurl:
                                snapshot.data![index]['urlToImage'] != null
                                    ? snapshot.data![index]['urlToImage']
                                    : constants.imageurl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description: snapshot.data![index]['description']
                                .toString());
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: appcolor.primary,
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
