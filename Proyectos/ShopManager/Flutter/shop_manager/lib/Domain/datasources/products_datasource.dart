import 'package:shop_manager/Domain/Entities/product_base.dart';



abstract class LocalStorageDatasource {
  
  Future <List<ProductBase>> cargarTodosProductos();

}