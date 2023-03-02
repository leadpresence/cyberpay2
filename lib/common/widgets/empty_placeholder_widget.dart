import 'package:cyberpay_mobile_2/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../configs/routes/route_paths.dart';
import '../configs/styles/app_sizes.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  /// Constructor for [EmptyPlaceholderWidget].
  const EmptyPlaceholderWidget({super.key, required this.message});

  /// Message to display.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () => context.goNamed(AppRoute.welcome.name),
              text: 'Go Home',
            ),
          ],
        ),
      ),
    );
  }
}
