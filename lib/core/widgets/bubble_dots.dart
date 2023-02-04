import 'package:flutter/material.dart';

/// StatelessWidget that generates [BubbleDots]  based on lenth of virtual card
class VirtualCardNavBubbles extends StatelessWidget {
  /// creates an instance of [VirtualCardNavBubbles]
  const VirtualCardNavBubbles(
      {Key? key, required this.lengthList, required this.position})
      : super(key: key);
  final int lengthList;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        lengthList,
        (index) => BubbleDots(
          index: index,
          position: position,
        ),
      ),
    );
  }
}

/// Single bubble for page views
class BubbleDots extends StatelessWidget {
  /// creates an instance of [BubbleDots]
  const BubbleDots({Key? key, required this.index, required this.position})
      : super(key: key);
  final index;
  final position;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color:
            position == index ? Theme.of(context).primaryColor : Colors.white,
        // Theme.of(context).primaryColor,
      ),
    );
  }
}
