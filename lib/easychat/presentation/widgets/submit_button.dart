
import 'package:flutter/material.dart';

import '../../../core/theme/app_pellete.dart';

class SubmitButton extends StatelessWidget {
  // const SubmitButton({super.key});
  final String buttonname;
  final VoidCallback onpressed;

  const SubmitButton({super.key, 
  required this.buttonname,
  required this. onpressed
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient:const LinearGradient(
          colors:[AppPallete.gradient1,
          AppPallete.gradient2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
           ),
           borderRadius: BorderRadius.circular(15)

      ),
      child: ElevatedButton(onPressed:
        onpressed
      
      , 
      style: ElevatedButton.styleFrom(
        backgroundColor:AppPallete.transparentColor,
        shadowColor: AppPallete.transparentColor,
        fixedSize: const Size(395, 55)
      ),
      
      
      child:  Text(buttonname,style: const TextStyle(
        fontSize: 17,fontWeight: FontWeight.w600
      ),)),
    );
  }
}