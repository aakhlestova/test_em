import 'package:flutter/cupertino.dart';

import '../../theme/text_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Page',
        style: inactiveProductTabTextStyle,
      ),
    );
  }
}
