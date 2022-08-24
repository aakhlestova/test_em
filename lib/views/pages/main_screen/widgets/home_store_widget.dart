import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/models/main_screen_model.dart';

class HomeStoreWidget extends StatefulWidget {
  final List<HomeStore> homeStoreDataList;
  HomeStoreWidget({Key? key, required this.homeStoreDataList}) : super(key: key);

  @override
  _HomeStoreWidgetState createState() => _HomeStoreWidgetState(homeStoreDataList);
}

class _HomeStoreWidgetState extends State<HomeStoreWidget> {
  final List<HomeStore> homeStoreDataList;

  _HomeStoreWidgetState(this.homeStoreDataList);


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _getImageList(homeStoreDataList).map((e) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(e,
              width: 378,
              height: 182,
              fit: BoxFit.cover,)
          ],
        ) ,
      )).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: true,
      ),

    );
  }
}

List<String> _getImageList(List<HomeStore> homeStoreDataList){

  List<String> imageList = [];
  for (int index = 0; index < homeStoreDataList.length; index++){
    imageList.add(homeStoreDataList[index].picture.toString());
  }
  return imageList;
}
