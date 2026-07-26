import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class SpiceySlider extends StatefulWidget {
  const SpiceySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpiceySlider> createState() => _SpiceySliderState();
}

class _SpiceySliderState extends State<SpiceySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/details/product.png", height: 250),
        const Spacer(),
        Column(
          children: [
            const Text(
              "Customize Your Burger \n to Your Tastes. Ultimate \n Experience",
            ),
            Slider(
              min: 0,
              max: 1,
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey.shade300,
              value: widget.value,
              onChanged: widget.onChanged,
            ),
            const Row(
              mainAxisSize: .max,
              children: [
                CustomText(text: "🥶"),
                Gap(110),
                CustomText(text: "🌶️"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
