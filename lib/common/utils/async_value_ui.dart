import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/alert_dialogs.dart';

/// Utility method on [AsyncValue] to show a dialog or snackbar when the value is not refreshing and has an error.
extension AsyncValueUI on AsyncValue {
  /// shows and alert dialog when the async value is not refreshing and has an error
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      showExceptionAlertDialog(
        context: context,
        title: 'Error',
        exception: error,
      );
    }
  }

  /// shows a snackbar when the async value is not refreshing and has an error
  void showSnackbarOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
