import 'package:flutter/material.dart';


class GeneratwButton extends StatelessWidget {
  const GeneratwButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: 
      (){
       
      
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue
      ),
       child: Text("GENERATE",style: TextStyle(
        color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold
       ),)
       ),
    );
  }
}