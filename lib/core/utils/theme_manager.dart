import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/style_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
//**********************card view theme ***********************//
    cardTheme: const CardTheme(
      color: ColorManager.backGroundecolor,
      elevation: AppSize.s8,
    ),
//**********************appBar theme ***********************//
    appBarTheme: AppBarTheme(
        color: ColorManager.backGroundecolor,
        centerTitle: true,
        elevation: AppSize.s0,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManager.textColor)),

//**********************button theme ***********************//
    // buttonTheme: ButtonThemeData(
    //   buttonColor: ColorManager.primary,
    //   shape: const StadiumBorder(),
    //   disabledColor: ColorManager.grey1,
    //   splashColor: ColorManager.lightPrimary,
    // ),

//**********************elevated button theme ***********************//
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         textStyle: getRegularStyle(
    //           color: ColorManager.white,
    //           fontSize: AppSize.s17,
    //         ),
    //         primary: ColorManager.primary,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12)))),
//**********************tzxt theme ***********************//
    // textTheme: TextTheme(
    //   displayLarge: getsemiBoldStyle(
    //       color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //   headlineLarge: getRegularStyle(
    //       color: ColorManager.darkGrey, fontSize: FontSize.s14),
    //   titleMedium:
    //       getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
    //   bodyLarge: getRegularStyle(color: ColorManager.grey1),
    //   bodySmall: getRegularStyle(color: ColorManager.grey),
    // ),
//**********************inputDecoration theme **************//
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   //************hint style ****************//
    //   hintStyle:
    //       getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),

    //   //*******label style************ *//
    //   labelStyle:
    //       getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //   //*************error style ************//
    //   errorStyle: getRegularStyle(color: ColorManager.error),
    //   //*******enabled broder style *************//
    //   enabledBorder: const OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: ColorManager.grey,
    //         width: AppSize.s1_5,
    //       ),
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(AppSize.s8),
    //       )),
    //   //*******errorBorder style *************//
    //   errorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: ColorManager.error,
    //         width: AppSize.s1_5,
    //       ),
    //       borderRadius: const BorderRadius.all(
    //         Radius.circular(AppSize.s8),
    //       )),
    //   //*******focusedBorder style *************//
    //   focusedBorder: const OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: ColorManager.grey,
    //         width: AppSize.s1_5,
    //       ),
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(AppSize.s8),
    //       )),
    //   //*******focusedErrorBorder style *************//
    //   focusedErrorBorder: const OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: ColorManager.primary,
    //         width: AppSize.s1_5,
    //       ),
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(AppSize.s8),
    //       )),
    // )
  );
}
