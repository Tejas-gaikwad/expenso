import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final double size;
  final bool checked;
  final Color? borderColor;
  final Color? iconColor;
  final Color? filledColor;
  final void Function()? onTap;
  final double borderWidth;

  const CustomCheckbox({
    Key? key,
    required this.size,
    this.onTap,
    this.checked = false,
    this.borderColor,
    this.filledColor,
    this.borderWidth = 1.5,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.5 : 1.0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: checked
                ? filledColor ?? AppColors.secondaryColor
                : Colors.transparent,
            border: Border.all(
              width: borderWidth,
              color: checked
                  ? AppColors.secondaryColor
                  : borderColor ?? AppColors.secondaryColor,
            ),
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.done,
              color:
                  checked ? (iconColor ?? AppColors.white) : Colors.transparent,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
