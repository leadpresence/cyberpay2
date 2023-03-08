
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import '../utils/app_strings.dart';

/// TabWidget
class TabWidget extends StatelessWidget {
  /// TabWidget
  const TabWidget({Key? key, required this.color, required this.item})
      : super(key: key);

  final BottomNavItem item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item.svgWidget,
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AutoSizeText(
            item.name,
            maxLines: 1,
            style: TextStyle(color: color),
            group: null,
          ),
        ),
      ],
    );
  }
}