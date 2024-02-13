import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/componentes1.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showmybottomsheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: appcolor.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomsheetlayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

_launchurl(String url) async {
  if (await canLaunchUrl(url as Uri)) {
    await launchUrl(url as Uri);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomsheetlayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomsheetlayout(
      {super.key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          bottomsheetimage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: Texting(
              text: description,
              size: 16,
              color: appcolor.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchurl(url);
                      },
                    style: GoogleFonts.lato(
                      color: Colors.blue.shade400,
                    ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
