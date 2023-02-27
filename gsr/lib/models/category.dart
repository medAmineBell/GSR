class Category {
  late String id;
  late String name;

  Category({
    required this.id,
    required this.name,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
  }
}
