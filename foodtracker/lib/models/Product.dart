class Product {
  final String name;
  final double price;
  final int quantity;
  final String shop;
  final String producer;
  final String unit;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.shop,
    required this.producer,
    required this.unit
  });

  double get pricePerQuantity => price / quantity;
}