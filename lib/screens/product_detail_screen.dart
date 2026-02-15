import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/cart_service.dart'; 

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(product.imageUrl, height: 300, fit: BoxFit.contain),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text("\$${product.price}", style: const TextStyle(fontSize: 20, color: Colors.blue)),
                        const SizedBox(height: 20),
                        Text(product.description, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // GÜNCELLEME: Alt tarafa sabit Buton
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // Sepete Ekleme İşlemi
                  CartService.addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product.title} sepete eklendi")),
                  );
                  Navigator.pop(context); // İstersen ekledikten sonra geri dön
                },
                child: const Text("Sepete Ekle", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    );
  }
}