import 'package:flutter/cupertino.dart';

import '../../../global_widgets/buttons.dart';
import '../../../global_widgets/text_fields.dart';

/// виджет поиска (главная страница)
class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchTextField(),
        Padding(
          padding: const EdgeInsets.only(left: 11.0),
          child: QrSearchButton(),
        )
      ],
    );
  }
}
