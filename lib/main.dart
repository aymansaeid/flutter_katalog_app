import 'package:flutter/material.dart';
import 'screens/discover_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Uygulama açıldığında bizi Discover (Keşfet) ekranı karşılayacak
      
      initialRoute: '/',
      routes: {
        '/': (context) => const DiscoverScreen(),
        '/detail': (context) => const ProductDetailScreen(),
      },
    );
  }
}

