import 'package:flutter/material.dart';
import 'package:news_app/backend/functions.dart';
// import 'package:news_app/components/appbar.dart';
import 'package:news_app/components/searchbar.dart';
import 'package:news_app/components/newsbox.dart';
import 'package:news_app/components/top-cat.dart';
import 'package:news_app/provider/provider_string.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  String category = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews("");
  }

  @override
  Widget build(BuildContext context) {
    final cat = Provider.of<changestring>(context, listen: false);
    void f(String temp) {
      cat.changecat(temp);
    }

    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appcolor.black,
      appBar: AppBar(
        actions: const [],
        backgroundColor: appcolor.black,
        elevation: 0,
        title: Container(
          height: 40,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Consumer<changestring>(
              builder: (context, value, child) {
                return boldtext(
                    text: cat.cats, color: appcolor.white, size: 20);
              },
            ),
            Texting(text: ' News', color: appcolor.lightwhite, size: 20),
          ]),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SerchBar(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                filters(text: 'Business', f: f),
                filters(text: 'Entertainment', f: f),
                filters(text: 'General', f: f),
                filters(text: 'Health', f: f),
                filters(text: 'Technology', f: f),
                filters(text: 'Science', f: f),
                filters(text: 'Sports', f: f),
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
              child: Consumer<changestring>(
                builder: (context, value, child) {
                  return FutureBuilder<List>(
                    future: fetchnews(value.cat),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return newsbox(
                                  url: snapshot.data![index]['url'],
                                  imageurl: snapshot.data![index]
                                          ['urlToImage'] ??
                                      constants.imageurl,
                                  title: snapshot.data![index]['title'],
                                  time: snapshot.data![index]['publishedAt'],
                                  description: snapshot.data![index]
                                          ['description']
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
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
