import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/add_product.dart';
import '../utils/order_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userCredential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddProductPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // User Profile Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        userCredential?.photoURL ?? '',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${userCredential?.displayName}'),
                        Text('Email: ${userCredential?.email}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(text: 'Ordered'),
                Tab(text: 'To Deliver'),
                Tab(text: 'Receipts'),
              ],
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              indicatorWeight: 3,
            ),

            // Tab Content
            const Expanded(
              child: TabBarView(
                children: [
                  OrderList(status: 'ordered'),
                  OrderList(status: 'to_deliver'),
                  OrderList(status: 'completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
