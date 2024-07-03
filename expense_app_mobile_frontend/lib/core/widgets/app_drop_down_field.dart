import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppDropDownField extends StatelessWidget {
  final String? hintText, labelText, titleText;
  final void Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onChanged;
  final TextInputType? kTextInputType;
  final dynamic value;
  final List<DropdownMenuItem<dynamic>>? items;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final double? itemHeight;
  final bool filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  const AppDropDownField({
    super.key,
    this.kTextInputType,
    this.hintText,
    this.labelText,
    this.contentPadding,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.value,
    this.itemHeight,
    required this.items,
    this.borderRadius = 36,
    this.filled = true,
    this.titleText,
    this.fillColor,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final field = DropdownButtonFormField(
      value: value,
      items: items,
      dropdownColor: Theme.of(context).cardColor,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      itemHeight: itemHeight,
      isDense: true,
      isExpanded: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        filled: true,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? AppColors.white,
        iconColor: AppColors.black,
        errorMaxLines: 3,
        hintStyle: AppTextStyle.bodyText14.copyWith(
          color: AppColors.textColor,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: AppColors.black, width: 0)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: AppColors.black, width: 0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: AppColors.black, width: 0)),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
      ),
    );
    return titleText != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  titleText!,
                  style: AppTextStyle.bodyText14
                      .copyWith(color: AppColors.textColor),
                ),
              ),
              const SizedBox(height: 6),
              field,
            ],
          )
        : field;
  }
}
