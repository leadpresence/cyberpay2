import 'package:flutter/material.dart';
import 'card_preview.dart';
import 'empty_add_virtual_cards.dart';

///  TabDollarCardView
class TabDollarCardView extends StatefulWidget {
  /// creates instance of [TabDollarCardView]
  const TabDollarCardView({Key? key}) : super(key: key);

  @override
  State<TabDollarCardView> createState() => _TabDollarCardViewState();
}

class _TabDollarCardViewState extends State<TabDollarCardView> {
  List<String> listOfCards = [];
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        if (listOfCards.isNotEmpty == true)
          const  SliverToBoxAdapter(
            child: EmptyAddCardView(),
          )
        else
          SliverFillRemaining(
            child: SizedBox(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 2,
                onPageChanged: (int index) {
                  setState(() {
                    setState(() {
                      currentIndex = index;
                    });
                  });
                },
                itemBuilder: (context, position) {
                  return VirtualCardsPreview(
                    totalLenght: 2,
                    cardPositionOnView: currentIndex,
                  );
                },
              ),
            ),
          ),
      ],
    ));
  }
}
