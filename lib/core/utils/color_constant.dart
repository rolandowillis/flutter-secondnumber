import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#737373');

  static Color gray400 = fromHex('#c4c4c4');

  static Color gray500 = fromHex('#969696');

  static Color gray800 = fromHex('#6e452e');

  static Color bluegray90014 = fromHex('#1433293d');

  static Color bluegray100 = fromHex('#cccfd4');

  static Color gray300 = fromHex('#e6e6e6');

  static Color black9000d = fromHex('#0d000000');

  static Color bluegray900 = fromHex('#243342');

  static Color gray3007f = fromHex('#7fe6e6e6');

  static Color black90021 = fromHex('#21000000');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color black900 = fromHex('#000000');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#8a8a8c');

  static Color black90040 = fromHex('#40000000');

  static Color bluegray200 = fromHex('#abb0b8');

  static Color black901 = fromHex('#030303');

  static Color bluegray9007f = fromHex('#7f243342');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
