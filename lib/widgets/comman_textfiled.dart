import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsy_deco/const/colour.dart';

Widget commaTextfiled({
  String? prefixIcon,
  String? hintText,
  String? suffixIcon,
}) {
  return TextField(
    enabled: false,
    decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            prefixIcon!,
            height: 24,
            width: 24,
            color: Colors.white,
            fit: BoxFit.fill,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            suffixIcon!,
            height: 24,
            width: 24,
            color: Colors.white,
            fit: BoxFit.fill,
          ),
        ),
        hintText: hintText!,
        hintStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'Nunito-SemiBold',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
  );
}

Widget commanContainer({String? image}) {
  return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(19)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          image!,
          color: Colors.white,
        ),
      ));
}
