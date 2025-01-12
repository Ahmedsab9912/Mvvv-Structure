import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool loading;
  final VoidCallback onTap;
  final TextStyle textStyle;

  const RoundButton({
    super.key,
    this.loading = false,
    required this.text,
    required this.color,
    required this.onTap,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
