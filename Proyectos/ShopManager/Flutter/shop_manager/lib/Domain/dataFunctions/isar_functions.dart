import 'package:dio/dio.dart';
import 'package:shop_manager/Domain/entities/product_base.dart';

void descargarProducts()async{
  final dio = Dio();
  final response = await dio.get('http://127.0.0.1:8000/products/all');
  print(response);



  if (response != null && response.statusCode == 200) {
    // Si la solicitud fue exitosa, convierte el cuerpo de la respuesta a una lista dinámica
    List<dynamic> products = response.data;
    
    // Recorre cada elemento de la lista de productos
    List<ProductBase> result =[];
    for (var product in products) {
      // Aquí puedes hacer lo que necesites con cada producto
    ProductBase  plocal =ProductBase.fromJson(product);
    print("Nombre:");
    result.add(plocal);
 
      print(plocal.name);
    }  } else {
    // Si la solicitud no fue exitosa, imprime un mensaje de error
    print('Error: La solicitud no fue exitosa');
  }


  
}
