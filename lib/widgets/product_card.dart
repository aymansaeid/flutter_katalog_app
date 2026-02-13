import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // Bu widget'ı çağırdığımızda içine ürün adı, fiyatı ve görseli gönderebileceğiz
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Hafif gölge
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Üst Kısım: Ürün Görseli
          Expanded( // Grid içinde taşma yapmaması için görseli sarmaladık
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl, 
                width: double.infinity,
                fit: BoxFit.cover,
                // Görsel yüklenirken hata oluşursa siyah bir ikon gösterir
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
              ),
            ),
          ),
          // Alt Kısım: Ürün Bilgileri
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1, // Uzun isimleri keser
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    const Icon(Icons.add_circle, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}