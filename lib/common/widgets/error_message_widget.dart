import 'package:flutter/material.dart';

/// Error message widget.
class ErrorMessageWidget extends StatelessWidget {
  /// Constructor for [ErrorMessageWidget].
  const ErrorMessageWidget(this.errorMessage, {super.key});

  /// Error message to display.
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
    );
  }
}
