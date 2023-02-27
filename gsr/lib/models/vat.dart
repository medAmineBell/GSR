class Vat {
  late String id;
  late String value;

  Vat({
    required this.id,
    required this.value,
  });

  Vat.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    value = json['value'];
  }
}
