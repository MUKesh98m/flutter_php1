class data_con {
  final String id;
  final String name;
  final String price;

  data_con({
    required this.id,
    required this.name,
    required this.price
  });
  factory data_con.fromJson(Map<String, dynamic> json) {
    return data_con(
      id: json['id'],
      name: json['name'],
      price: json['price'] ,
    );
  }
}