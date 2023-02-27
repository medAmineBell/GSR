class Product {
  late String id;
  late String name;
  late String reference;
  late String quantity;
  late String salespricettc;
  late String category;
  late String supplier;
  late String vat;

  Product({
    required this.id,
    required this.name,
    required this.reference,
    required this.quantity,
    required this.salespricettc,
    required this.category,
    required this.supplier,
    required this.vat,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    reference = json['reference'];
    quantity = json['quantity'].toString();
    salespricettc = json['sales_price_ttc'].toString();
    category = json['category'];
    supplier = json['supplier'];
    vat = json['vat'];
  }
}
