import 'package:flutter/material.dart';

class CDivider extends StatelessWidget {
  const CDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.black.withOpacity(.1),
    );
  }
}