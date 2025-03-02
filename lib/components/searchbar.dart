import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/utils/colors.dart';

class SerchBar extends StatefulWidget {
  const SerchBar({super.key});
  static TextEditingController searchcntrl = TextEditingController(text: '');

  @override
  State<SerchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SerchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: appcolor.deepgrey,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: SerchBar.searchcntrl,
                    decoration: InputDecoration(
                      hintText: 'Search a keyword or a phrase',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        InkWell(
          onTap: () {
            print(SerchBar.searchcntrl.text);
            FocusScope.of(context).unfocus();
            fetchNews(SerchBar.searchcntrl.text);
          },
          child: Container(
            width: 45,
            height: 45,
            decoration:
                BoxDecoration(color: appcolor.deepgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: appcolor.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
