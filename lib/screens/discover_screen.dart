import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              // Buraya tıklandığında ilerde Sepet sayfasına gideceğiz
            }, 
            icon: const Icon(Icons.shopping_bag_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Arama Çubuğu
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Ürün ara...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // 2. Banner [cite: 76]
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Colors.blue, Colors.indigo]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Özel Fırsatlar\nGIFT STORE", 
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Ürünler Başlığı
              const Text(
                "Katalog",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // 4. GridView (Raporun ana isterlerinden biri) 
              GridView.builder(
                shrinkWrap: true, // Scroll içinde scroll olduğu için şart
                physics: const NeverScrollableScrollPhysics(), 
                itemCount: 6, // Şimdilik 4 tane örnek
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Yan yana 2 ürün 
                  childAspectRatio: 0.75, // Kartların en-boy oranı
                  mainAxisSpacing: 10, // Dikey boşluk
                  crossAxisSpacing: 10, // Yatay boşluk
                ),
                itemBuilder: (context, index) {
                  return const ProductCard(
                    title: "AirPods Pro 2",
                    price: "249",
                    imageUrl: "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/2-300_large.jpg", // Test URL
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}