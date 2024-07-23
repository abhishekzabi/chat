import 'package:flutter/material.dart';

class Buffer extends StatelessWidget {
  const Buffer({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Colors.blue,
      strokeWidth: 4,
    );
  }
}