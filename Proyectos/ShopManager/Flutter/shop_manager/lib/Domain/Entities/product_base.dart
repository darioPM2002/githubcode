import 'package:isar/isar.dart';
part "product_base.g.dart";
@collection
class ProductBase {
  
  Id? isarId;
  final String name;
  final List<String> priceName;
  final List<double> prices;
  final int typeProduct;
  final String description;
  final String originProduct;

  ProductBase(this.prices, {
    required this.name, 
    required this.priceName, 
    required this.typeProduct, 
    required this.description, 
    required this.originProduct});
  


}