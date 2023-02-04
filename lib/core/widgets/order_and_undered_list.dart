import 'package:flutter/material.dart';

/// StatelessWidget  Ordered List
class OrderedList extends StatelessWidget {
  /// Constructor  Ordered List
  const OrderedList({super.key, required this.texts});
  final List<dynamic> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    int counter = 0;
    for (var text in texts) {
      // Add list item
      counter++;
      widgetList.add(OrderedListItem('• ', text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }
    return SizedBox(child: Column(children: widgetList));
  }
}
/// StatelessWidget OrderedListItem
class OrderedListItem extends StatelessWidget {
  /// StatelessWidget OrderedListItem
  const OrderedListItem(this.prefix, this.text, {super.key});
  final dynamic prefix;
  final String text;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('$prefix '),
          Expanded(
            child: Text(text,maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
        ],
      ),
    );
  }
}
