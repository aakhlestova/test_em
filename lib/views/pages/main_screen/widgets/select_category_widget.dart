import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/theme/buttons.dart';
import 'package:test_em/views/theme/text_styles.dart';

class SelectCategoryWidget extends StatefulWidget {
  const SelectCategoryWidget({Key? key}) : super(key: key);

  @override
  _SelectCategoryWidgetState createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  int _selectedCategory = 0;

  void _changeCategory(int categoryNumber){
    setState(() {
      _selectedCategory = categoryNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectCategoryHeading,
              style: headingTextStyle,
            ),
            TextButton(
              onPressed: (){},
              child: Text(
                viewAllText,
                style: accentTextStyle,
              ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
            height: 95.0,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                TabCategoryButton(
                    title: categoryPhonesText,
                    selectedCategory: _selectedCategory,
                    categoryNumber: 0,
                    icon: 'assets/images/home/categories/phones.png',
                    icon_active:  'assets/images/home/categories/phones_active.png',
                    onPressed: () => _changeCategory(0),
                ),
                TabCategoryButton(
                    title: categoryComputerText,
                    selectedCategory: _selectedCategory,
                    categoryNumber: 1,
                    icon: 'assets/images/home/categories/computer.png',
                    icon_active:  'assets/images/home/categories/computer_active.png',
                    onPressed: () => _changeCategory(1),
                ),
                TabCategoryButton(
                    title: categoryHealthText,
                    selectedCategory: _selectedCategory,
                    categoryNumber: 2,
                    icon: 'assets/images/home/categories/health.png',
                    icon_active:  'assets/images/home/categories/health_active.png',
                    onPressed: () => _changeCategory(2),
                ),
                TabCategoryButton(
                    title: categoryBooksText,
                    selectedCategory: _selectedCategory,
                    categoryNumber: 3,
                    icon: 'assets/images/home/categories/books.png',
                    icon_active:  'assets/images/home/categories/books_active.png',
                    onPressed: () => _changeCategory(3),
                ),
                TabCategoryButton(
                    title: "Other",
                    selectedCategory: _selectedCategory,
                    categoryNumber: 4,
                    icon: 'assets/images/home/categories/books.png',
                    icon_active:  'assets/images/home/categories/books_active.png',
                    onPressed: () => _changeCategory(4),

                ),
              ],
            ),
          ),
        )
      ],
    );
  }


}

