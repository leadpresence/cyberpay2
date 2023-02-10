import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/styles/app_colors.dart';
import 'custom_expansion_card.dart';

class PlanCard extends StatelessWidget {
  /// Title of the card
  final String? title;

  /// Widgets
  List<Widget> widget;

  /// Creates instance of [PlanCard]
  PlanCard({Key? key, this.title, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: CustomExpansionTileCard(
            headerShadowColor: AppColors.primary,
            shadowColor: AppColors.primary.withOpacity(0.9),
            expandedTextColor: AppColors.ligthBlue,
            elevation: 2,
            key: key,
            leading: const SizedBox.shrink(),
            title: Text(
              title ?? ' ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
            ),
            children: widget));
  }
}
