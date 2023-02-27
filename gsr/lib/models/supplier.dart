class Supplier {
  late String id;
  late String name;

  Supplier({
    required this.id,
    required this.name,
  });

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['company_name'];
  }
}
