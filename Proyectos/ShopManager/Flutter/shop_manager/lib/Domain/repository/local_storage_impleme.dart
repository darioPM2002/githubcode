import 'package:shop_manager/Domain/Entities/product_base.dart';
import 'package:shop_manager/Domain/datasources/products_datasource.dart';
import 'package:shop_manager/Domain/repository/products_repository.dart';

class LocalStorageRepositoryImplementation extends LocalStorageRepository{
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImplementation({required this.datasource});

  @override
  Future<List<ProductBase>> cargarTodosProductos() {
    return datasource.cargarTodosProductos();
  }
  
}