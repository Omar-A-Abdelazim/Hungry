import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.text,
    required this.description,
    required this.image,
    required this.rate,
  });
  final String text;
  final String description;
  final String image;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.asset(image, width: 180),
            Gap(7),
            CustomText(text: text),
            Gap(3),
            CustomText(text: description),
            Gap(3),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amberAccent),
                Gap(4),
                CustomText(text: rate),
                Spacer(),
                Icon(Icons.favorite, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
