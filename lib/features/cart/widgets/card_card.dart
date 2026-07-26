import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class CartCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  const CartCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 28, right: 17, top: 19, bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + title + subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
              const Gap(6),
              CustomText(text: title, fontWeight: FontWeight.bold),
              CustomText(text: subtitle),
            ],
          ),
          const Spacer(),
          // Quantity + Remove button
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _QuantityButton(icon: Icons.remove, onTap: onDecrement),
                  const Gap(31.7),
                  CustomText(text: quantity.toString()),
                  const Gap(31.7),
                  _QuantityButton(icon: Icons.add, onTap: onIncrement),
                ],
              ),
              const Gap(30),
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  width: 154,
                  height: 43,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: const Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _QuantityButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 39,
        height: 43,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
