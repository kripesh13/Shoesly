import 'package:flutter/material.dart';
import 'package:shoesly/constant/constant.dart';

class DetailsScreen extends StatelessWidget {
  String? name;
  String? image;
  String? size;

  DetailsScreen({ this.image, this.name, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.shopping_bag_outlined),
        ],
      ),
      body: Container(
        padding: kStandardPadding(),
        child: Column(
          children: [
         
            Text(name!),
            Image.asset(image!),
            Text(size!),
            
          ],
        ),
      ),
    );
  }
}
