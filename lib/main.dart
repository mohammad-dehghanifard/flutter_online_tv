import 'package:flutter/material.dart';
import 'package:flutter_online_tv/resources/app_colors.dart';
import 'package:flutter_online_tv/view/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa'),
      title: 'Flutter Online Tv',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}