import 'package:flutter/material.dart';

class ButtonSlkeleton extends StatelessWidget {
  const ButtonSlkeleton({Key? key, this.isMaxHeight = false, this.width})
      : super(key: key);
  final bool? isMaxHeight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMaxHeight! ? 50.0 : 40.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(isMaxHeight! ? 14.0 : 10.5),
      ),
    );
  }
}
