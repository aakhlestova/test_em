import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      width: MediaQuery.of(context).size.width - 144,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          hintText: searchHintText,
          hintStyle: searchHintTextStyle,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 10.0),
            child: SizedBox(
              height: 16.0,
              width: 16.0,
              child: Image.asset('assets/images/home/search.png', height: 16.0,)),
          ),
          fillColor: widgetBackgroundColor,
        ),
        style: searchTextStyle,
      ),
    );
  }
}
