import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.verticalMargin,
      required this.btnChild,
      this.onTap});

  final double verticalMargin;
  final Widget btnChild;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.greenAccent,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        child: btnChild,
      ),
    );
  }
}
