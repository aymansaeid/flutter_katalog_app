import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../models/cart_service.dart';
import 'cart_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // Daha fazla ürün ekledik ve açıklamaları doldurduk
  final List<Product> productList = [
    Product(
        title: "AirPods Pro 2",
        price: "249",
        imageUrl: "https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111851_sp880-airpods-Pro-2nd-gen.png",
        description: "Aktif Gürültü Engelleme ve Şeffaf Mod özelliklerine sahip. Uzamsal ses teknolojisi ile sinema deneyimi sunar. MagSafe şarj kutusu ile birlikte gelir."),
    Product(
        title: "iPhone 15 Pro",
        price: "999",
        imageUrl: "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/iphone-15-pro-max.png",
        description: "Havacılık sınıfı titanyum tasarım. A17 Pro çip ile oyunlarda konsol kalitesinde performans. 48 MP Ana kamera ile inanılmaz detaylar."),
    Product(
        title: "Macbook Pro 14",
        price: "1999",
        imageUrl: "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/mbp14-m4-2024.png",
        description: "M3 Pro çip ile süper güç. 22 saate varan pil ömrü. Liquid Retina XDR ekran ile olağanüstü dinamik aralık."),
    Product(
        title: "iPad Air",
        price: "599",
        imageUrl: "https://www.apple.com/newsroom/images/product/ipad/standard/apple_new-ipad-air_new-design_09152020.jpg.news_app_ed.jpg",
        description: "M1 çip performansı. 10.9 inç Liquid Retina ekran. Touch ID, gelişmiş kameralar ve 5G desteği."),
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
                onPressed: () async {
                  // Sepete gidip gelince de güncelle
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                  setState(() {});
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
              if (CartService.items.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${CartService.items.length}',
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
            return ProductCard(
              product: productList[index],
              // DÜZELTME BURADA:
              onTap: () async {
                // 1. Detay sayfasına git ve bekle (await)
                await Navigator.pushNamed(
                  context, 
                  '/detail', 
                  arguments: productList[index]
                );
                // 2. Geri dönüldüğünde bu satır çalışır -> Ekranı yenile
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}