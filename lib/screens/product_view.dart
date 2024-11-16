import 'package:flutter/material.dart';
import 'package:star_fashion/utils/text_style.dart';

import '../utils/app_color.dart';
import '../widgets/product_view_widget.dart';
import '../widgets/top_container.dart';

class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'C H I C S',
              style: TextStyles.titleStyle,
            ),
            centerTitle: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: TabBar(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: AppColor.backgroundColor,
            dividerColor: Colors.white,
            onTap: (value) {
              setState(() {
                selectedValue = value;
              });
              tabController.animateTo(value);
            },
            tabs: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedValue == 0
                      ? AppColor.backgroundColor
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: const Center(child: Text('Trending')),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedValue == 1
                      ? AppColor.backgroundColor
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Center(child: Text('New Arrivals')),
              ),
            ],
          ),
        ),
        // Add other slivers here, such as SliverList or SliverGrid
      ],
    );
  }
}
