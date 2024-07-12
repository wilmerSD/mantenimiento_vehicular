import 'package:flutter/material.dart';

class DatatableSkeleton extends StatelessWidget {
  const DatatableSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
        filaSkeleton(),
        SizedBox(height: 10.0),
      ],
    );
  }
}

class filaSkeleton extends StatelessWidget {
  const filaSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(14.0),
      ),
    );
  }
}
