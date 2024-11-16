import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  final String status;

  const OrderList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 10, // Replace with actual order count
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text('Order #${index + 1}'),
            subtitle:
                Text('Status: ${status.replaceAll('_', ' ').toUpperCase()}'),
            trailing: Text('\$99.99'), // Replace with actual order amount
            onTap: () {
              // Navigate to order details
            },
          ),
        );
      },
    );
  }
}
