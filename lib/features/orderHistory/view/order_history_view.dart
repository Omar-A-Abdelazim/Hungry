import 'package:flutter/material.dart';
import 'package:hungry/features/orderHistory/widgets/order_history_card.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OrderHistoryCard(
                imagePath: "assets/splash/splash.png",
                title: "Hamburger",
                quantity: 3,
                price: 20,
                buttonText: "Details",
                onButtonTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
