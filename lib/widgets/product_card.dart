import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 16,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: const Color(0xff2C2C2C),

        border: Border.all(
          color: Colors.green,
          width: 3,
        ),

        boxShadow: const [

          BoxShadow(
            color: Colors.black,
            offset: Offset(6, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            product.name.toUpperCase(),

            style: const TextStyle(
              fontSize: 12,
              color: Colors.lightGreenAccent,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Rp ${product.price.toStringAsFixed(0)}",

            style: const TextStyle(
              fontSize: 10,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            product.description,

            style: const TextStyle(
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}