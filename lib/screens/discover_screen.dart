import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../models/cart_service.dart'; // Sepet servisini ekle
import 'cart_screen.dart'; // Sepet ekranını ekle

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // Ürünleri buraya ekliyoruz (Senin kodunla aynı)
  final List<Product> productList = [
    Product(
        title: "AirPods Pro 2",
        price: "249",
        imageUrl: "https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111851_sp880-airpods-Pro-2nd-gen.png",
        description: "Gürültü engelleme özellikli üst düzey kulaklık."),
    Product(
        title: "iPhone 15 Pro",
        price: "999",
        imageUrl: "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/iphone-15-pro-max.png",
        description: "Titanyum kasa ve güçlü işlemci."),
    Product(
        title: "Macbook Pro 14",
        price: "1999",
        imageUrl: "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/mbp14-m4-2024.png",
        description: "Yaratıcı profesyoneller için en güçlü dizüstü bilgisayar."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini Katalog", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // GÜNCELLEME: İkona basınca Sepet Ekranına git
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  ).then((_) => setState(() {})); // Geri döndüğünde sayıyı güncelle
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
              // Eğer sepette ürün varsa sayıyı göster
              if (CartService.items.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${CartService.items.length}', // GÜNCELLEME: Gerçek sayıyı göster
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index]);
          },
        ),
      ),
    );
  }
}