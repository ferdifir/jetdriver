import 'package:flutter/material.dart';
import 'package:jetdriver/routes/routes.dart';

class JetApp extends StatelessWidget {
  const JetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      routes: Routes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: true,
      ),
    );
  }
}
