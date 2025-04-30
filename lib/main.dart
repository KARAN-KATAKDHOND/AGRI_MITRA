import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/contact.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/RegisterScreen.dart';
import 'screens/learn_screen.dart';
import 'screens/profile_screen.dart';

import 'model/cart_model.dart'; // Your cart model

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          CartModel(), // This makes CartModel available app-wide
      child: AgriMitraApp(),
    ),
  );
}

class AgriMitraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agri Mitra',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/wallet': (context) => WalletScreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
        '/payment': (context) => PaymentScreen(),
        '/learning': (context) => LearningScreen(),
        '/contact': (context) => ContactUsPage(), // ✅ ADDED Contact Page
      },
    );
  }
}
