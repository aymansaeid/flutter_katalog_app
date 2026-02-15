import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: Colors.white, // Arka planı temiz beyaz yapalım
      appBar: AppBar(
        title: Text(product.title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Büyük Ürün Görseli
                  Center(
                    child: Hero( // Hero animasyonu geçişi şıklaştırır
                      tag: product.imageUrl,
                      child: Image.network(
                        product.imageUrl, 
                        height: 300, 
                        fit: BoxFit.contain
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // İçerik Alanı
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Başlık ve Fiyat
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.title, 
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                              ),
                            ),
                            Text(
                              "\$${product.price}", 
                              style: const TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold)
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Renk Seçenekleri (Simülasyon)
                        const Text("Colors", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _buildColorDot(Colors.black, true),
                            _buildColorDot(Colors.grey, false),
                            _buildColorDot(Colors.blueAccent, false),
                            _buildColorDot(Colors.redAccent, false),
                          ],
                        ),
                        const SizedBox(height: 25),

                        // Açıklama Başlığı
                        const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          product.description, 
                          style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5)
                        ),
                        
                        const SizedBox(height: 25),
                        
                        // Özellikler (Specifications) - Kutucuklu Tasarım
                        const Text("Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildSpecCard("Size", "3.3 inch"),
                              _buildSpecCard("Audio", "360° Sound"),
                              _buildSpecCard("Connectivity", "Bluetooth 5.0"),
                              _buildSpecCard("Warranty", "2 Years"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40), // Alt boşluk
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Sabit Alt Buton
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
                onPressed: () {
                  CartService.addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${product.title} sepete eklendi"),
                      duration: const Duration(milliseconds: 800),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context); // Ekleyince geri dönüp güncellemesini izle!
                },
                child: const Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Yardımcı Widget: Renk Yuvarlağı
  Widget _buildColorDot(Color color, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: color, width: 2) : null,
      ),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }

  // Yardımcı Widget: Özellik Kartı
  Widget _buildSpecCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}