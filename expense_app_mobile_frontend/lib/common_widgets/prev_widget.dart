import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PrevWidget extends StatefulWidget {
  final void Function()? onTap;
  const PrevWidget({
    super.key,
    this.onTap,
  });

  @override
  State<PrevWidget> createState() => _PrevWidgetState();
}

class _PrevWidgetState extends State<PrevWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Wrap(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                  size: 18,
                ),
                SizedBox(width: 15),
                Text(
                  "Prev",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
