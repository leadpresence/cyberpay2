import 'package:cyberpay_mobile_2/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class LeadingIconCustomTextField extends StatefulWidget {
  const LeadingIconCustomTextField({
    Key? key,
    this.width,
    this.textController,
    this.validator,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.floatingLabelBehaviour = FloatingLabelBehavior.auto,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSaved,
    this.isPasswordField = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.onTap,
    this.maxLines = 1,
    this.isUnique,
    this.hintText,
    this.focusedBorderColor = AppColors.primary,
    this.filled = false,
    this.isStaticPasswordField = false,
  }) : super(key: key);

  final double? width;
  final bool isStaticPasswordField;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final Widget? label;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final bool? isUnique;
  final Color focusedBorderColor;
  final bool filled;
  final int maxLines;
  final String? hintText;

  @override
  State<LeadingIconCustomTextField> createState() =>
      _LeadingIconCustomTextFieldState();
}

class _LeadingIconCustomTextFieldState
    extends State<LeadingIconCustomTextField> {
  bool _obscureText = true;
  var _focusNode = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      height: 54,
      width: widget.width ?? screen.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 3, color: Colors.transparent),
        color: widget.filled == true
            ? const Color(0XFFEBEBEB).withOpacity(.6)
            : Colors.transparent,
      ),
      child: Center(
        child: TextFormField(
          controller: widget.textController,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          enableInteractiveSelection: true,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          // cursorHeight: .4,
          cursorWidth: 1,
          cursorColor: AppColors.ligthBlue,
          // cursorHeight: 18,
          obscuringCharacter: '●',
          obscureText: widget.isPasswordField ? _obscureText : false,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.start,
          style: GoogleFonts.openSans(
            color: AppColors.black,
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            label: widget.label,
            hintText: widget.hintText??'',
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPasswordField
                ? PasswordSuffixWidget(
                    obscureText: _obscureText,
                    onPressed: _toggle,
                  )
                : widget.suffixIcon,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.ligthBlue,
                width: 1,
              ),
            ),
            contentPadding: widget.isStaticPasswordField
                ? const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 24,
                  )
                : widget.maxLines != 1
                    ? const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 12,
                      )
                    : const EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(
                color: AppColors.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  const PasswordSuffixWidget({
    Key? key,
    required this.onPressed,
    required this.obscureText,
  }) : super(key: key);

  final void Function() onPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 25,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: SizedBox(
        width: 44,
        child: SvgPicture.asset(
          obscureText ? 'assets/svgs/eye-slash.svg' : 'assets/svgs/eye.svg',
          height: 10,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
