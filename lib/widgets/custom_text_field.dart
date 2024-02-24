import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.formIcon,
    this.hintText,
    required this.obscureText,
    required this.formeData,
  });

  final Widget? formIcon;
  final String? hintText;
  late final bool obscureText;
  TextEditingController formeData = TextEditingController();

  final TextStyle formTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: formeData,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: formTextStyle,
        prefixIcon: formIcon,
      ),
      style: formTextStyle,
    );
  }
}
