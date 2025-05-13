import 'package:flutter/material.dart';
import 'package:jetdriver/routes/routes.dart';
import 'package:jetdriver/utils/auth_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool isUserLoggedIn = AuthUtils.isLoggedIn();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (isUserLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.HOME);
      } else {
        Navigator.pushReplacementNamed(context, Routes.LOGIN);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'JetDriver',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}