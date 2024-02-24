import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.btnTitle,
    required this.onTop,
    this.btnHeight,
    this.btnWidth,
    this.btnColor,
    this.btnTextStyle,
  });

  final String? btnTitle;
  final Function() onTop;
  final double? btnHeight;
  final double? btnWidth;
  final Color? btnColor;
  final TextStyle? btnTextStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTop,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor ?? Colors.black,
        minimumSize: Size(
          btnWidth ?? MediaQuery.of(context).size.width,
          btnHeight ?? MediaQuery.of(context).size.height,
        ),
      ),
      child: Text(
        btnTitle ?? 'btnTitle',
        style: btnTextStyle ?? mainBtnTextStyle,
        ),
    );
  }
}
