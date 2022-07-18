import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomElevation({
    required this.child,
    required this.height,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: height / 5,
            offset: Offset(0, height / 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
