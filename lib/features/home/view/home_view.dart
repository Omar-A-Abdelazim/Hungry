import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/custom_search_bar.dart';
import 'package:hungry/features/home/widgets/food_category.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
import 'package:hungry/features/product/view/product_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ["All", "Combos", "Sliders", "Classic"];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 140,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: UserHeader(),
              ),
            ),

            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const Gap(25),
                    // Search bar
                    CustomSearchBar(),
                    const Gap(25),
                    FoodCategory(
                      category: category,
                      selectedCategory: selectedCategory,
                      onCategorySelected: (index) {
                        setState(() {
                          selectedCategory =
                              index; // ⬅️ التغيير الحقيقي بيحصل هنا بس
                        });
                      },
                    ),
                    Gap(25),
                  ],
                ),
              ),
            ),
            // GridView
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) {
                            return ProductDetailView();
                          },
                        ),
                      );
                    },
                    child: CardItem(
                      text: "cheeseburger",
                      description: "Wendy's Burger",
                      image: "assets/test/test.png",
                      rate: '4.9',
                    ),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.67,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
