import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigator aracılığıyla gönderilen verileri burada "ModalRoute" ile alıyoruz
    final Map<String, dynamic> product = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']), // Ürün başlığı AppBar'da görünecek
      ),
      body: Column(
        children: [
          Image.network(
            product['imageUrl'],
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${product['price']}",
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ürün Açıklaması:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("Bu ürün yüksek kaliteli malzemelerden üretilmiştir."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}