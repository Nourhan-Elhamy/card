import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name),),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.Image),
            Text(
              '\$${product.price.toStringAsFixed(0)}',
            ),
            const SizedBox(height: 8),

            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: TextStyle(color: Colors.grey[700], height: 1.4),
            ),
          ],
        ),
      )

    );
  }
}
