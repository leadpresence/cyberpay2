import 'package:flutter/material.dart';

import '../configs/styles/app_sizes.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  /// Constructor for [PrimaryButton].
  const PrimaryButton(
      {super.key,
      this.isLoading = false,
      this.btnHeight ,
      this.btnWidth ,
      this.onPressed,
      required this.text,
      this.buttonColor = Colors.grey,
      this.buttonBorderColor = Colors.transparent,
      });

  /// Text to display on the button.
  final String text;

  /// Optional Height of button
  final double? btnHeight;
  /// Optional Width of button

  final double? btnWidth;

  /// Color  to the background of the button
  final Color buttonColor;

  /// Color  to the border of the button
  final Color buttonBorderColor;

  /// If true, a loading indicator will be displayed instead of the text.
  final bool isLoading;

  /// Callback to be called when the button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight??Sizes.p48,
      width: btnWidth?? screenSize(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            side:   BorderSide(
                width: 1, // thickness
                color: buttonBorderColor, // color
                ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        // ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(buttonColor,),
        // ),
        child: isLoading
            ?   const Padding(
                padding: EdgeInsets.all(10.0),

                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
