import 'package:flutter/material.dart';

import '../constant/constant.dart';


Widget getStar(double ratings) {
  List<Widget> stars = [];
  for (int i = 1; i <= 5; i++) {
    if (i <= ratings) {
      stars.add(Icon(Icons.star, color: yellowColor));
    } else if (i - 0.5 <= ratings) {
      stars.add(Icon(Icons.star_half, color: yellowColor));
    } else {
      stars.add(Icon(Icons.star, color: greyColor));
    }
  }
  return Row(children: stars);
}
