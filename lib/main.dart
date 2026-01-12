import 'package:flutter/material.dart';
import 'package:flutter_croissance/pages/SignupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Croissance Plus',
      theme: ThemeData(
       
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SignupScreen(),
    );
  }
}

InputDecoration _buildFieldDecoration(String label, {Widget? prefix}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(
      // color: _AppColors.placeholder,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    filled: true,
    fillColor: Colors.white,
    prefixIconConstraints:
        const BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 52),
    prefixIcon: prefix == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: prefix,
          ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    
  );
}