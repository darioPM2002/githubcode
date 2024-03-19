import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lealtad_program/helpers/users.dart';

class Mapper {
  
  static UsuarioExistente mapToUser (DocumentSnapshot document){
      String docId = document.id;            //obtener nota por cada documento
      Map <String, dynamic> data = document.data() as Map<String, dynamic>;
      
      final UsuarioExistente user = UsuarioExistente(
        visitas: data["visitas"] ?? 0,
        correo: data["correo"]??"",
        nombre: data["nombre"]??"",
        puntos: (data["puntos"] ?? 0).toDouble(),
        userId: docId
      );      
     
     return user;
  }
}