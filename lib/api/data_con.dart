class data_con {
  final int id;
  final String name;
  final int age;

  data_con({required this.id, required this.name, required this.age});
  factory data_con.fromJson(Map<String, dynamic> json) {
    return data_con(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }
}