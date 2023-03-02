import 'package:cyberpay_mobile_2/common/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/styles/app_colors.dart';
import '../configs/styles/app_sizes.dart';

/// StatelessWidget  CustomTextField
class CustomTextField extends StatelessWidget {
  /// Creates instance of CustomTextField
  const CustomTextField({
    Key? key,
    required this.title,
     this.hint,
    this.isPassword = false,
    required this.controller,
    this.onChanged,
    required this.inputType,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  /// String Label of field
  final String title;
  final String? hint;


  /// TextEditingController
  final TextEditingController controller;

  /// Bool if true field will have obscure text
  final bool isPassword;

  /// Void Function when changes occur
  final Function(String)? onChanged;

  /// Input Type
  final TextInputType inputType;

  ///
  final List<TextInputFormatter>? inputFormatters;
  ///
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        gapH8,
        TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:  AppColors.blue2.withOpacity(0.2),
                width: 2.0,
              ),
            ),
            errorBorder:  OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.red.withOpacity(0.2),
                width: 2.0,
              ),
            ),
            errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.black,
            ),
          ),
          controller: controller,
          onChanged: (String? value) => onChanged,
          cursorColor: Colors.black12,
          keyboardType: inputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),

      ],
    );
  }
}
