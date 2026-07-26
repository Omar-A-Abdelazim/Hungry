import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistory/view/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController pageController;
  late List<Widget> pages = [];
  int currentScreen = 0;

  @override
  void initState() {
    pages = [
      const HomeView(),
      const CartView(),
      OrderHistoryView(),
      const ProfileView(),
    ];
    pageController = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentScreen = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.primary,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(child: Icon(Icons.newspaper), label: 'Order'),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentScreen = index;
            pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
