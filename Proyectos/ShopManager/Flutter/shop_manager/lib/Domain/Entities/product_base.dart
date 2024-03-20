import 'dart:convert';
import 'package:isar/isar.dart';
part "product_base.g.dart";


List<ProductBase> productBaseFromJson(String str) => List<ProductBase>.from(json.decode(str).map((x) => ProductBase.fromJson(x)));

String productBaseToJson(List<ProductBase> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@collection
class ProductBase {
  
  final Id? isarId;
  final String name;
  final List<String> priceName;
  final List<double> prices;
  final int typeProduct;
  final String description;
  final String originProduct;

  ProductBase( {
    required this.isarId,
    required this.prices, 
    required this.name, 
    required this.priceName, 
    required this.typeProduct, 
    required this.description, 
    required this.originProduct});
  
    factory ProductBase.fromJson(Map<String, dynamic> json) => ProductBase(
        isarId: json["id"],
        name: json["name"],
        prices: List<double>.from(json["priceQ"].map((x) => x)),
        priceName: List<String>.from(json["priceN"].map((x) => x)),
        typeProduct: json["typep"],
        description: json["des"],
        originProduct: json["origin"],
    );

    Map<String, dynamic> toJson() => {
        "id": isarId,
        "name": name,
        "priceQ": List<dynamic>.from(priceName.map((x) => x)),
        "priceN": List<dynamic>.from(prices.map((x) => x)),
        "typep": typeProduct,
        "des": description,
        "origin": originProduct,
    };


}