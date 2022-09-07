import 'package:flutter/cupertino.dart';

import '../../../../data/models/product_details_model.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';


class CapacitySelectorWidget extends StatefulWidget {

  final ProductDetails productDetailsDataList;
  const CapacitySelectorWidget({Key? key, required this.productDetailsDataList}) : super(key: key);

  @override
  _CapacitySelectorWidgetState createState() => _CapacitySelectorWidgetState(productDetailsDataList);
}

class _CapacitySelectorWidgetState extends State<CapacitySelectorWidget> {
  final ProductDetails productDetailsDataList;
  _CapacitySelectorWidgetState(this.productDetailsDataList);

  int _selectedCapacity = 0;
  List<String> capacities = [];


  void _changeCapacity(int capacityNumber){
    setState(() {
      _selectedCapacity = capacityNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int count = 0; count < productDetailsDataList.capacity!.length; count++){
      capacities.add(productDetailsDataList.capacity![count].toString());
    }
    return SizedBox(
      height: 30.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CapacitySelector(
              capacity: capacities[0],
              selectedCapacity: _selectedCapacity,
              capacityNumber: 0,
              onPressed:() => _changeCapacity(0)
          ),
          CapacitySelector(
              capacity: capacities[1],
              selectedCapacity: _selectedCapacity,
              capacityNumber: 1,
              onPressed:() => _changeCapacity(1)
          ),
        ],
      ),
    );
  }
}


class CapacitySelector extends StatelessWidget {
  final String capacity;
  final int selectedCapacity;
  final int capacityNumber;
  final Function onPressed;

  CapacitySelector({Key? key, required this.capacity, required this.selectedCapacity, required this.capacityNumber, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
       Padding(
         padding: const EdgeInsets.only(left: 10.0),
         child: GestureDetector(
          onTap: () => onPressed(),
          child: Container(
            height: 30.0,
            width: 72.0,
            decoration: BoxDecoration(
              color: selectedCapacity == capacityNumber ? orangeAccentColor : widgetBackgroundColor,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Center(
              child: Text(
                capacity + " GB",
                style: selectedCapacity == capacityNumber ? selectedCapacityButtonTextStyle : unselectedCapacityButtonTextStyle,
              ),
            )
          ),
    ),
       );
  }
}

