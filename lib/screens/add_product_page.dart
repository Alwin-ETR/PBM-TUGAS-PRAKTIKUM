import 'package:flutter/material.dart';

import '../services/product_service.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() =>
      _AddProductPageState();
}

class _AddProductPageState
    extends State<AddProductPage> {

  final nameController =
      TextEditingController();

  final priceController =
      TextEditingController();

  final descriptionController =
      TextEditingController();

  bool isLoading = false;

  Future<void> saveProduct() async {

    setState(() {
      isLoading = true;
    });

    final success =
        await ProductService.addProduct(

      name: nameController.text,

      price:
          int.parse(priceController.text),

      description:
          descriptionController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (success) {

      Navigator.pop(context);

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text("ITEM BERHASIL DITAMBAHKAN"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "ADD ITEM",
          style: TextStyle(fontSize: 12),
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: nameController,

              decoration:
                  const InputDecoration(
                labelText: "Item Name",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: priceController,

              keyboardType:
                  TextInputType.number,

              decoration:
                  const InputDecoration(
                labelText: "Price",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller:
                  descriptionController,

              maxLines: 4,

              decoration:
                  const InputDecoration(
                labelText: "Description",
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed:
                    isLoading
                        ? null
                        : saveProduct,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "SAVE ITEM",
                        style: TextStyle(
                          fontSize: 10,
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