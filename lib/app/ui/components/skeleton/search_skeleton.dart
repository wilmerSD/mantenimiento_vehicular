import 'package:flutter/material.dart';

class SearchSkeleton extends StatelessWidget {
  const SearchSkeleton({Key? key, this.isMaxHeight}) : super(key: key);
  final double? isMaxHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isMaxHeight ?? 120.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14.0),
      ),
    );
  }
}
