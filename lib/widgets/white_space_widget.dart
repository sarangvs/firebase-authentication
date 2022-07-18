import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightWhiteSpace extends StatelessWidget {
  const HeightWhiteSpace(this.percentage, {Key? key}) : super(key: key);
  final double percentage;
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: Get.height * (percentage / 100));
}

class WidthWhiteSpace extends StatelessWidget {
  const WidthWhiteSpace(this.percentage, {Key? key}) : super(key: key);
  final double percentage;
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: Get.width * (percentage / 100));
}
