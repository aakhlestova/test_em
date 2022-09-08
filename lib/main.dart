import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_em/src/presentation/pages/dashboard/dashboard_page.dart';


void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
