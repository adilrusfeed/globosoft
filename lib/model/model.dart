class Product {
  final String id;
  final String name;
  final String? description;
  final String stockStatus;
  final String price;
  final String thumb;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.stockStatus,
    required this.price,
    required this.thumb,
  });

factory Product.fromJson(Map<String, dynamic> json) {
  
  return Product(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    stockStatus: json['stock_status'],
    price: json['price'],
    thumb: json['thumb'],
  );
}
}