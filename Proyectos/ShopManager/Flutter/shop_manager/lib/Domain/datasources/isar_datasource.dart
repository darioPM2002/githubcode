import 'package:isar/isar.dart';
import 'package:shop_manager/Domain/Entities/product_base.dart';
import 'package:shop_manager/Domain/datasources/products_datasource.dart';
import 'package:path_provider/path_provider.dart';
class IsarDataSource extends LocalStorageDatasource{
  late Future<Isar> db;
  IsarDataSource(){
    db = openDb();
  }


  
  Future<Isar> openDb() async{
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      
      return await Isar.open([ProductBaseSchema],inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }
  
    @override
  Future<List<ProductBase>> cargarTodosProductos() {
    // TODO: implement cargarTodosProductos
    throw UnimplementedError();
  }

}