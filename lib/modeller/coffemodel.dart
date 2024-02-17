class CoffeModel {
  final String name;
  final double price;
  final String imageUrl;
  final String boyut;
  final int adet;

  CoffeModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.boyut,
    required this.adet,
  });

  factory CoffeModel.fromJson(Map<String, dynamic> json) {
    return CoffeModel(
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      boyut: json['boyut'] ?? '',
      adet: json['adet'] ?? 0,
    );
  }
}
