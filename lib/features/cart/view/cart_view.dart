import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/cart/widgets/card_card.dart';
import 'package:hungry/shared/custom_text.dart';

class CartItemModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final double price;
  int quantity;

  CartItemModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<CartItemModel> _items = List.generate(
    6,
    (index) => CartItemModel(
      title: "Hamburger",
      subtitle: "Veggie Burger",
      imagePath: "assets/splash/splash.png",
      price: 3.15,
    ),
  );

  double get _total =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 130),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CartCard(
                imagePath: item.imagePath,
                title: item.title,
                subtitle: item.subtitle,
                quantity: item.quantity,
                onIncrement: () {
                  setState(() => item.quantity++);
                },
                onDecrement: () {
                  if (item.quantity > 1) {
                    setState(() => item.quantity--);
                  }
                },
                onRemove: () {
                  setState(() => _items.removeAt(index));
                },
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          color: Colors.white,
        ),
        height: 110,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: 'Total', fontSize: 20),
                CustomText(
                  text: '\$ ${_total.toStringAsFixed(2)}',
                  fontSize: 26,
                ),
              ],
            ),
            Container(
              width: 170,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Center(
                child: CustomText(text: "Checkout", color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
