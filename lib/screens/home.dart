import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:star_fashion/screens/profile.dart';

import '../utils/app_color.dart';
import '../utils/tab_bar.dart';
import 'cart.dart';
import 'category_view.dart';
import 'product_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                ProductDisplayScreen(),
                CategoryDisplayScreen(),
                CartPage(),
                ProfilePage(),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    TabBarIcons.tabBarIcons.length,
                    (index) => IconButton(
                      onPressed: () {
                        pageController.jumpToPage(index);
                      },
                      icon: Icon(
                        TabBarIcons.tabBarIcons[index],
                        color:
                            currentIndex == index ? Colors.white : Colors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
