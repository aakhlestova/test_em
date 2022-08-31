import 'package:flutter/cupertino.dart';

import '../../theme/text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: inactiveProductTabTextStyle,
      ),
    );
  }
}
