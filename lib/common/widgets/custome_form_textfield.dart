import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../configs/styles/app_colors.dart';
import '../configs/styles/app_sizes.dart';

/// CustomSearchTextField
class CustomSearchTextField extends StatefulWidget {
  /// creates an instance of [CustomSearchTextField]
  const CustomSearchTextField({super.key,
    this.readOnly = false,
    this.onTap,
    this.isDropdownField = false,
    this.textController,
    this.suffixIcon = '',
    this.prefixIcon = '',
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.labelText,
    this.width,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.maxLength = 600,
    this.isPasswordField = false,
    this.errorText = '',
    this.onSaved,
    this.onChanged,
    this.isReferralCode = false,
    this.prefixIconIsText = false,
    this.contentPadding = const EdgeInsets.only(left: 16),
  });

  final bool isReferralCode;
  final EdgeInsets contentPadding;
  final void Function()? onTap;
  final bool isDropdownField, readOnly;
  final onSaved;
  final maxLength;
  final void Function(String)? onChanged;
  final width;
  final maxLines;
  final errorText;
  final bool prefixIconIsText;
  final isPasswordField;
  final textCapitalization;
  final textController;
  final textInputAction;
  final labelText;
  final keyboardType;
  final hintText;
  final String suffixIcon;
  final String prefixIcon;

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  FocusNode _focusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? screenSize(context).width,
      child: TextFormField(
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly,
        focusNode: _focusNode,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        enableInteractiveSelection: true,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: true,
          cut: true,
          selectAll: true,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        obscuringCharacter: '●',
        obscureText: widget.isPasswordField ? _obscureText : false,
        controller: widget.textController,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black.withOpacity(.8),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,//.primary.withOpacity(.05),
          counterText: "",
          errorStyle: const TextStyle(fontSize: 0, height: 0),
          errorText: widget.errorText,
          prefixIcon:

          Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 14,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.transparent),
                        child: SvgPicture.asset(
                          widget.prefixIcon,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
          suffixIcon: widget.suffixIcon == ''
              ? null
              : GestureDetector(
                  onTap: () => _toggle(),
                  child: SvgPicture.asset(
                    widget.suffixIcon,
                    height: 14,
                    width: 14,
                    color: Colors.black26.withOpacity(.65),
                  ),
                ),
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          labelText: widget.labelText,
          floatingLabelBehavior: widget.isReferralCode
              ? FloatingLabelBehavior.never
              : FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              fontSize: _focusNode.hasFocus ? 14 : 12,
              color: _focusNode.hasFocus
                  ? widget.errorText == ''
                      ? AppColors.primary
                      : Colors.transparent
                  : Colors.black26,
              fontWeight:
                  _focusNode.hasFocus ? FontWeight.w600 : FontWeight.w600),
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.black26.withOpacity(.45),
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 10,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 10,
            ),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(24),
          //   borderSide: const BorderSide(
          //     color: Colors.red,
          //     width: 1,
          //   ),
          // ),
          focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 10,
            ),
          ),

        ),
        onTap: widget.onTap,
      ),
    );
  }
}
