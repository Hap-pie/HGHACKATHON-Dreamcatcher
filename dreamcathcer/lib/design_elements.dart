import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignElements{

  //#region Colors

  static Color emptyPink =  const Color(0xffA08B87);
  static Color mainPink =  const Color(0xffF9DBD4);
  static Color accentPink = const Color(0xffB55051);

  //#endregion

  //#region Margin Sizes

  static double marginXLarge = 64;
  static double marginDefault = 16;
  static double marginMedium = 12;
  static double marginXSmall = 4;

  //#endregion

  //#region TextStyles
 static TextStyle emptyStateFontMerri = GoogleFonts.merriweather(
    color: emptyPink,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 2);

static TextStyle emptyStateFontUrban = GoogleFonts.urbanist(
    color: emptyPink,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5);

static TextStyle ctaJosefin = GoogleFonts.urbanist(
    color: mainPink,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

static TextStyle timerStyle = GoogleFonts.urbanist(
    color: mainPink,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 0);

static TextStyle cardBodyStyle = GoogleFonts.josefinSans(
    color: Color(0xffD7BCB7),
    fontSize: 16,
    height: 1.3,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5);    

static TextStyle cardTitleStyle = GoogleFonts.merriweather(
    color: mainPink,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5);  

static TextStyle dateStyle = GoogleFonts.merriweather(
    color: Color(0xffA08B87),
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5);  

  //#endregion

}