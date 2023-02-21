part of 'utils.dart';

String _applyStyle(Styles style, String text) {
  return buildEscSeq(style) + text + buildEscSeq(Styles.reset);
}

String buildEscSeq(Styles style) {
  return "\u{1B}[${getStyle(style)}m";
}

String getStyle(Styles style) {
  switch (style) {
    case Styles.reset:
      return '0';
    case Styles.bold:
      return '1';
    case Styles.dark:
      return '2';
    case Styles.italic:
      return '3';
    case Styles.underline:
      return '4';
    case Styles.blink:
      return '5';
    case Styles.reverse:
      return '7';
    case Styles.concealed:
      return '8';
    case Styles.defaults:
      return '39';
    case Styles.blank:
      return '30';
    case Styles.red:
      return '31';
    case Styles.green:
      return '32';
    case Styles.yellow:
      return '33';
    case Styles.blue:
      return '34';
    case Styles.magenta:
      return '35';
    case Styles.cyan:
      return '36';
    case Styles.lightGray:
      return '37';
    case Styles.darkGray:
      return '90';
    case Styles.lightRed:
      return '91';
    case Styles.lightGreen:
      return '92';
    case Styles.lightYellow:
      return '93';
    case Styles.lightBlue:
      return '94';
    case Styles.lightMagenta:
      return '95';
    case Styles.lightCyan:
      return '96';
    case Styles.white:
      return '97';
    case Styles.bgDefault:
      return '49';
    case Styles.bgBlack:
      return '40';
    case Styles.bgRed:
      return '41';
    case Styles.bgGreen:
      return '42';
    case Styles.bgYellow:
      return '43';
    case Styles.bgBlue:
      return '44';
    case Styles.bgMagenta:
      return '45';
    case Styles.bgCyan:
      return '46';
    case Styles.bgLightGray:
      return '47';
    case Styles.bgDarkGray:
      return '100';
    case Styles.bgLightRed:
      return '101';
    case Styles.bgLightGreen:
      return '102';
    case Styles.bgLightYellow:
      return '103';
    case Styles.bgLightBlue:
      return '104';
    case Styles.bgLightMagenta:
      return '105';
    case Styles.bgLightCyan:
      return '106';
    case Styles.bgWhite:
      return '107';
    default:
      return '';
  }
}

enum Styles {
  reset,
  bold,
  dark,
  italic,
  underline,
  blink,
  reverse,
  concealed,
  defaults,
  blank,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  lightGray,
  darkGray,
  lightRed,
  lightGreen,
  lightYellow,
  lightBlue,
  lightMagenta,
  lightCyan,
  white,
  bgDefault,
  bgBlack,
  bgRed,
  bgGreen,
  bgYellow,
  bgBlue,
  bgMagenta,
  bgCyan,
  bgLightGray,
  bgDarkGray,
  bgLightRed,
  bgLightGreen,
  bgLightYellow,
  bgLightBlue,
  bgLightMagenta,
  bgLightCyan,
  bgWhite,
}
