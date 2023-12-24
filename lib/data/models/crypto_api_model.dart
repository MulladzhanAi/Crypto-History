class CryptoApiModel {
  final String name;
  final String symbol;
  final String id;
  final double current_price;
  final String image;

  CryptoApiModel(
      {required this.name,
        required this.symbol,
        required this.id,
        required this.current_price,
        required this.image
    });

  factory CryptoApiModel.fromJson(Map<String, dynamic> json) {
    return CryptoApiModel(
      name: json['name'],
      symbol: json['symbol'],
      id: json['id'],
      current_price:json['current_price'],
      image: json['image'],
    );
  }
}
