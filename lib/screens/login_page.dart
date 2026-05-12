import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool isLoading = false;

  Future<void> login() async {

    setState(() {
      isLoading = true;
    });

    final success = await AuthService.login(
      username: usernameController.text,
      password: passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (success) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login gagal"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed:
                    isLoading ? null : login,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}