
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class SignInPage extends ConsumerWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await auth.signIn(emailController.text, passwordController.text);
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
