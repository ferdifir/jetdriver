import 'package:flutter/material.dart';
import 'package:jetdriver/routes/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final vehiclePlateController = TextEditingController();

  bool isLoading = false;

  void handleRegister() async {
    setState(() => isLoading = true);

    final payload = {
      "name": nameController.text.trim(),
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text,
      "phone": phoneController.text.trim(),
      "vehicle_type": vehicleTypeController.text.trim(),
      "vehicle_plate": vehiclePlateController.text.trim(),
      "role": "driver"
    };

    // TODO: Kirim payload ke API register

    await Future.delayed(const Duration(seconds: 1)); // simulasi delay

    setState(() => isLoading = false);
    // TODO: Navigasi ke halaman login jika sukses
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Driver')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama')),
            TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username')),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true),
            TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'No. HP')),
            TextField(
                controller: vehicleTypeController,
                decoration: const InputDecoration(labelText: 'Tipe Kendaraan')),
            TextField(
                controller: vehiclePlateController,
                decoration:
                    const InputDecoration(labelText: 'Plat Nomor Kendaraan')),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: isLoading ? null : handleRegister,
              child: isLoading
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Daftar'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.LOGIN),
              child: const Text('Sudah punya akun? Login'),
            )
          ],
        ),
      ),
    );
  }
}
