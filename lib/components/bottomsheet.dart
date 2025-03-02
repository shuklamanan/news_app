import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/componentes1.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageUrl, url) {
  print(title);
  print(description);
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
          imageurl: imageUrl,
          title: title,
          description: description,
        );
      });
}

_launchurl(String url) async {
  if (await launchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
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
    // print(url);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          bottomsheetimage(imageurl: imageurl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child: Texting(
              text: description,
              size: 16,
              color: appcolor.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
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
