import 'package:flutter/material.dart';

class ToppingCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final VoidCallback? onAdd;

  const ToppingCard({
    super.key,
    this.name = 'Tomato',
    this.imagePath = 'assets/product/tomato.png',
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 99,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main container (dark background) with shadow
          Container(
            width: 84,
            height: 99,
            decoration: BoxDecoration(
              color: const Color(0xFF2E2A2A),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    // بلس مرسوم يدويًا بدل الأيقونة عشان يبقى متمركز 100%
                    child: Center(
                      child: SizedBox(
                        width: 8,
                        height: 8,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 1.6,
                              color: Colors.white,
                            ),
                            Container(
                              width: 1.6,
                              height: 8,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Top image container
          Positioned(
            top: -2,
            left: 0,
            child: Container(
              width: 84,
              height: 61,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(6),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
