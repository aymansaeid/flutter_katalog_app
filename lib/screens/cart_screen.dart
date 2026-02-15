import 'package:flutter/material.dart';
import '../models/cart_service.dart'; 
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim")),
      body: CartService.items.isEmpty
          ? const Center(
              // Sepet Boş Görünümü (Görseldeki 4. ekran)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text("Sepetin şu an boş", style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            )
          : Column(
              children: [
                // Sepet Dolu Görünümü (Görseldeki 3. ekran)
                Expanded(
                  child: ListView.builder(
                    itemCount: CartService.items.length,
                    itemBuilder: (context, index) {
                      final product = CartService.items[index];
                      return ListTile(
                        leading: Image.network(product.imageUrl, width: 50),
                        title: Text(product.title),
                        subtitle: Text("\$${product.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              CartService.removeFromCart(product);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Alt Kısım: Toplam Fiyat ve Checkout Butonu
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
                        // Ödeme işlemi simülasyonu
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Sipariş alındı!")),
                        );
                        setState(() {
                          CartService.clearCart();
                        });
                      },
                      child: const Text("Checkout", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}