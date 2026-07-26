import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class OrderHistoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final int quantity;
  final double price;
  final String buttonText;
  final VoidCallback? onButtonTap;

  const OrderHistoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.quantity,
    required this.price,
    this.buttonText = "text",
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 90, height: 90),
          const Gap(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(text: title, fontWeight: FontWeight.bold),
                  const Gap(4),
                  CustomText(text: "Qty : X$quantity"),
                  const Gap(4),
                  CustomText(text: "Price : ${price.toStringAsFixed(0)}\$"),
                  const Gap(12),
                  GestureDetector(
                    onTap: onButtonTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        text: buttonText,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
