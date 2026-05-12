import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

import '../widgets/product_card.dart';

import 'add_product_page.dart';
import 'submit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ProductModel> products = [];

  bool isLoading = true;

  Future<void> getProducts() async {

  try {

    final result =
        await ProductService.getProducts();

    setState(() {
      products = result;
    });

  } catch (e) {

    print(e);

  } finally {

    setState(() {
      isLoading = false;
    });
  }
}

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "PIXEL STORE",
          style: TextStyle(fontSize: 14),
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment:
            MainAxisAlignment.end,

        children: [

          FloatingActionButton(
            heroTag: "add",

            backgroundColor:
                Colors.green,

            onPressed: () async {

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AddProductPage(),
                ),
              );

              getProducts();
            },

            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            heroTag: "submit",

            backgroundColor:
                Colors.orange,

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const SubmitPage(),
                ),
              );
            },

            child: const Icon(Icons.send),
          ),
        ],
      ),

      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : products.isEmpty

              ? const Center(
                  child: Text(
                    "NO ITEM",
                    style:
                        TextStyle(fontSize: 12),
                  ),
                )

              : ListView.builder(

                  padding:
                      const EdgeInsets.all(16),

                  itemCount: products.length,

                  itemBuilder: (context, index) {

                    final product =
                        products[index];

                    return ProductCard(
                      product: product,
                    );
                  },
                ),
    );
  }
}