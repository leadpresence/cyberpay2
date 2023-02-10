import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_message_widget.dart';

/// Async value widget.
class AsyncValueWidget<T> extends StatelessWidget {
  /// Constructor for [AsyncValueWidget].
  const AsyncValueWidget({super.key, required this.value, required this.data});

  /// Async value to display.
  final AsyncValue<T> value;

  /// Widget to display when the async value is data.
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => Center(
          child: CupertinoActivityIndicator(key: key)),
    );
  }
}
