import 'package:flutter/material.dart';

class QuateSection extends StatelessWidget {
 final String quatestext;
 QuateSection({required this.quatestext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text(quatestext)),
      
        ),
      ),
    );
  }
}