import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String? titleText, hintText, labelText;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? minLines;
  final int maxLines;
  final TextStyle? textStyle;
  final double borderRadius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final bool autofocus;
  final Key? fieldKey;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  const AppTextFormField({
    super.key,
    this.enabled = true,
    this.titleText,
    this.keyboardType,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.validator,
    this.controller,
    this.minLines,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.autofocus = false,
    this.borderRadius = 36,
    this.textStyle,
    this.obscureText = false,
    this.fillColor,
    this.contentPadding,
    this.hintStyle,
    this.suffixIconConstraints,
    this.fieldKey,
    this.maxLength,
    this.inputFormatters,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var field = TextFormField(
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      enabled: enabled,
      key: fieldKey,
      style: textStyle ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
      keyboardType: keyboardType,
      cursorColor: AppColors.textColor,
      controller: controller,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      onSaved: onSaved,
      onTap: onTap,
      onChanged: onChanged,
      obscureText: obscureText,
      focusNode: focusNode,
      autofocus: autofocus,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? AppTextStyle.formHintTextStyle,
        fillColor: fillColor ?? AppColors.white,
        filled: true,
        contentPadding: contentPadding ?? EdgeInsets.fromLTRB(16, 10, 16, 10),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: suffixIconConstraints,
        errorMaxLines: 3,
        counterText: "",
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide:
              BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide:
              BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide:
              BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
      ),
    );
    return titleText == null
        ? field
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                titleText!,
                style: AppTextStyle.bodyText14
                    .copyWith(color: AppColors.textColor),
              ),
              const SizedBox(height: 6),
              field,
            ],
          );
  }
}
