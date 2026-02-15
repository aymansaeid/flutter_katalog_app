import 'product_model.dart';

class CartService {
  static final List<Product> items = [];

  static void addToCart(Product product) {
    items.add(product);
  }

  static void removeFromCart(Product product) {
    items.remove(product);
  }
  
  static void clearCart() {
    items.clear();
  }
}