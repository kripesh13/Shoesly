import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoesly/constant/ui_helpers.dart';

import '../constant/constant.dart';
import '../model/shoes_model/shoes_moke_data.dart';

class ShoesTiles extends StatelessWidget {
  final String brand;
  final String model;
  final double price;
  final String color;
  final String size;
  final String imageUrl;
  final double ratings;

  ShoesTiles(
      {required this.brand,
      required this.model,
      required this.price,
      required this.color,
      required this.size,
      required this.imageUrl,
      required this.ratings,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: kPadding(),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(40, 16, 16, 16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getBrandLogo(brand),
                  Hero(
                    tag: '$imageUrl$brand',
                    child: Image.asset(
                      imageUrl,
                      height: 130,
                      width: 150,
                    ),
                  ),
                ],
              )),
          sSizedBox(),
          Text(
            '''$brand $model''',
            style: kkTextStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          // sSizedBox(),
          Row(
            children: [
              Icon(
                Icons.star,
                color: yellowColor,
              ),
              minWidthSpan(),
              Text(
                ratings.toString(),
                style: kkBoldTextStyle(),
              ),
              maxWidthSpan(),
              Text(
                '(1045 Reviews),',
                style: kTextStyle().copyWith(color: greyColor),
              )
            ],
          ),
          // sSizedBox(),
          Text(
            '\$ ${price.toString()},00',
            style: kkBoldTextStyle().copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}



_getBrandLogo(String brand) {
  switch (brand) {
    case 'Nike':
      return Image.asset('assets/icons/nike.png',
          height: 30, width: 30, fit: BoxFit.contain, color: Color(0xffB7B7B7));
    case 'Adidas':
      return Image.asset(
        'assets/icons/adidas.png',
        height: 30,
        width: 30,
        fit: BoxFit.contain,
        color: Color(0xffB7B7B7),
      );
    case 'Puma':
      return Image.asset('assets/icons/puma.png',
          height: 30, width: 30, fit: BoxFit.contain, color: Color(0xffB7B7B7));
    case 'Reebok':
      return Image.asset('assets/icons/reebok.png',
          height: 30, width: 30, fit: BoxFit.contain, color: Color(0xffB7B7B7));
    case 'New Balance':
      return Image.asset('assets/icons/nb.png',
          height: 30, width: 30, fit: BoxFit.contain, color: Color(0xffB7B7B7));
    default:
      return Container();
  }
}
