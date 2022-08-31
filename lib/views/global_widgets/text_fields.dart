import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

/// текстовое поле строки поиска
class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      width: MediaQuery.of(context).size.width - 144,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: widgetBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: widgetBackgroundColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: widgetBackgroundColor,
              ),
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
        ),
        style: searchTextStyle,
      ),
    );
  }
}

/// текстовое поле фильтрации
class FilterTextField extends StatefulWidget {
  List <String> itemsList;
  FilterTextField({Key? key, required this.itemsList}) : super(key: key);

  @override
  _FilterTextFieldState createState() => _FilterTextFieldState(itemsList);
}

class _FilterTextFieldState extends State<FilterTextField> {
  List <String> itemsList;
  _FilterTextFieldState(this.itemsList);


  @override
  Widget build(BuildContext context) {
    String? selectedItem = itemsList[0];
    return Container(
      height: 37.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: secondaryTextColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(5.0)
      ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String> (
              icon: Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              items: itemsList
                  .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Material(child: Text(item, style: filterTextStyle,))))
                  .toList(),
              onChanged: (item) => setState(() {
                selectedItem = item;
              }),
            value: selectedItem,
      ),
          ),
        ),
    );
  }
}
