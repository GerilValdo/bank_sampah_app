import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

IconData mapIconName(String iconName) {
  switch (iconName) {
    case 'bottleWater':
      return FontAwesomeIcons.bottleWater;
    case 'scroll':
      return FontAwesomeIcons.scroll;
    case 'canFood':
      return FontAwesomeIcons.recycle;
    case 'wineBottle':
      return FontAwesomeIcons.wineBottle;
    case 'computer':
      return FontAwesomeIcons.computer;
    case 'leaf':
      return FontAwesomeIcons.leaf;
    default:
      return FontAwesomeIcons.recycle; // fallback icon
  }
}
