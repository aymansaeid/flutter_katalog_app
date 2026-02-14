class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // JSON formatındaki veriyi nesneye dönüştürür.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toString(),
      imageUrl: json['image'],
      description: json['description'],
    );
  }
}