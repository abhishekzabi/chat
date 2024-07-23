import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  
  final String errormessage;

   ErrorMessage( {required this.errormessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.error,color: Colors.red,size: 32,),
       Padding(
         padding: const EdgeInsets.all(15),
         child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text(errormessage)),
               
          ),
               ),
       ),


      ]
    );
    
  }
}