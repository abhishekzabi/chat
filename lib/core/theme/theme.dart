
import 'package:chatapp/core/theme/app_pellete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static  _border({Color focusedcolor=AppPallete.borderColor})
  {return
     OutlineInputBorder(
        borderSide: BorderSide(
          color:focusedcolor,
          width: 3 ),
          borderRadius: BorderRadius.circular(10)
      );}
  static final darkThemeMode=ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder:_border(),
      focusedBorder: _border(focusedcolor: AppPallete.gradient2)

    )
  );
}