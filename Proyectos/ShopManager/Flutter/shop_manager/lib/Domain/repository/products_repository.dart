import 'package:shop_manager/Domain/Entities/product_base.dart';

abstract class LocalStorageRepository {
  
  Future <List<ProductBase>> cargarTodosProductos();

}