import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Gap(20),
            SvgPicture.asset(
              "assets/logo/hungry.svg",
              color: AppColors.primary,
              height: 35,
            ),
            const Gap(5),
            CustomText(
              text: "hello, Omar Ahmed",
              fontSize: 16,
              fontWeight: .w600,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(radius: 30),
      ],
    );
  }
}
