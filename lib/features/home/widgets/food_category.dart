import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({
    super.key,
    required this.category,
    required this.selectedCategory,
    required this.onCategorySelected, // ⬅️ جديد: طريقة نبلّغ بيها الأب
  });

  final List category;
  final int selectedCategory;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return GestureDetector(
            onTap: () =>
                onCategorySelected(index), // ⬅️ بس بيبلّغ، مش بيغيّر حاجة بنفسه
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: selectedCategory == index
                    ? AppColors.primary
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              child: CustomText(
                text: category[index],
                fontWeight: FontWeight.w600,
                color: selectedCategory == index ? Colors.white : Colors.black,
              ),
            ),
          );
        }),
      ),
    );
  }
}
