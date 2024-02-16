import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/components/bottomsheet.dart';
import 'package:news_app/components/componentes1.dart';
import 'package:news_app/components/corousels.dart';
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
  List<Widget> newsimg = [];
  List text = [], description = [], imgurl = [], url = [];
  String category = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews("");
  }

  Future<void> refresh() async {
    setState(() {});
    return await Future.delayed(const Duration(milliseconds: 10));
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
      body: LiquidPullToRefresh(
        backgroundColor: appcolor.black,
        animSpeedFactor: 5.0,
        onRefresh: () async {
          setState(() {});
          return await Future.delayed(Duration(milliseconds: 10));
        },
        child: Column(
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
              height: 15,
            ),
            VerticalSliderDemo(
              imgslide: newsimg,
              description: [],
              imgurl: [],
              text: [],
              url: [],
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
                          newsimg.clear();
                          text.clear();
                          url.clear();
                          description.clear();
                          imgurl.clear();
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            newsimg.add(
                              InkWell(
                                onTap: () {
                                  showmybottomsheet(
                                      context,
                                      snapshot.data![i]['title'],
                                      snapshot.data![i]['description'],
                                      snapshot.data![i]['urlToImage'],
                                      snapshot.data![i]['url']);
                                },
                                child: Container(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Container(
                                        foregroundDecoration:
                                            const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    snapshot.data![i]
                                                            ['urlToImage'] ??
                                                        constants.imageurl),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width: 300,
                                          child: boldtext(
                                              text: snapshot.data![i]['title'],
                                              color: Colors.white,
                                              size: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                            //newsimg.add(snapshot.data![i]['urlToImage'] ?? "");
                            print(snapshot.data![i]['urlToImage']);
                          }
                          return ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}
/**
 * class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}
 */
