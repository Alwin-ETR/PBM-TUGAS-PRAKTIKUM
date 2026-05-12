import 'package:flutter/material.dart';

import '../services/product_service.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() =>
      _SubmitPageState();
}

class _SubmitPageState
    extends State<SubmitPage> {

  final nameController =
      TextEditingController();

  final priceController =
      TextEditingController();

  final descriptionController =
      TextEditingController();

  final githubController =
      TextEditingController();

  Future<void> submitTask() async {

    final success =
        await ProductService.submitTask(

      name: nameController.text,

      price:
          int.parse(priceController.text),

      description:
          descriptionController.text,

      githubUrl:
          githubController.text,
    );

    if (success) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text("TASK SUBMITTED"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "SUBMIT TASK",
          style: TextStyle(fontSize: 12),
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: SingleChildScrollView(

          child: Column(

            children: [

              TextField(
                controller: nameController,
                decoration:
                    const InputDecoration(
                  labelText: "Product Name",
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
                decoration:
                    const InputDecoration(
                  labelText: "Description",
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller:
                    githubController,
                decoration:
                    const InputDecoration(
                  labelText: "GitHub URL",
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: submitTask,

                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}