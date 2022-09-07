import 'package:flutter/cupertino.dart';

import '../../../../data/models/product_details_model.dart';
import '../../../theme/colors.dart';

class ColorSelectorWidget extends StatefulWidget {

  final ProductDetails productDetailsDataList;
  const ColorSelectorWidget({Key? key, required this.productDetailsDataList}) : super(key: key);

  @override
  _ColorSelectorWidgetState createState() => _ColorSelectorWidgetState(productDetailsDataList);
}

class _ColorSelectorWidgetState extends State<ColorSelectorWidget> {
  final ProductDetails productDetailsDataList;
  _ColorSelectorWidgetState(this.productDetailsDataList);

  int _selectedColor = 0;
  List<String> colors = [];


  void _changeColor(int colorNumber){
    setState(() {
      _selectedColor = colorNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int count = 0; count < productDetailsDataList.color!.length; count++){
      colors.add(productDetailsDataList.color![count].toString());
    }
    return SizedBox(
      height: 45.0,
      child: ListView(
        padding: EdgeInsets.only(right: 19.0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ColorSelector(
              color: colors[0],
              selectedColor: _selectedColor,
              colorNumber: 0,
              onPressed:() => _changeColor(0)
          ),
          ColorSelector(
              color: colors[1],
              selectedColor: _selectedColor,
              colorNumber: 1,
              onPressed:() => _changeColor(1)
          ),
        ],
      ),
    );
  }
}

class ColorSelector extends StatelessWidget {
  final String color;
  final int selectedColor;
  final int colorNumber;
  final Function onPressed;

  ColorSelector({Key? key, required this.color, required this.selectedColor, required this.colorNumber, required this.onPressed}) : super(key: key);

  Image selectedIcon = Image.asset('assets/images/productDetails/selected_icon.png', height: 12.5,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19.0),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          height: 39.0,
          width: 39.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hexToColor(color),
          ),
          child: selectedColor == colorNumber ? Center(child: selectedIcon,) : Container(),
        ),
      ),
    );
  }
}

