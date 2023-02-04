import 'package:flutter/material.dart';

import 'empty_add_virtual_cards.dart';


/// TabNairaCard
class TabNairaCard extends StatefulWidget {
  /// Creates an instance of [ TabNairaCard]
  const TabNairaCard({Key? key}) : super(key: key);

  @override
  State<TabNairaCard> createState() => _TabNairaCardState();
}

class _TabNairaCardState extends State<TabNairaCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyAddCardView(),
    );
  }
}


