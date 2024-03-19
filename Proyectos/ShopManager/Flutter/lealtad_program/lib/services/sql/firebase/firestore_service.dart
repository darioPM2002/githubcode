import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lealtad_program/helpers/users.dart';

class FirestoreService {
  //instancia de la base de datos  "lealtad_programa" es la colección que se va usar
  final CollectionReference user = FirebaseFirestore.instance.collection("lealtad_programa");
  //instancia de la base de datos

  //Crear un registro en la base de datos
  Future <String> agregarUsuario(UsuarioNuevo nuevoUsuario){
    print("_______");
    String nombreCompleto="${nuevoUsuario.nombre} ${nuevoUsuario.apellido}" ;
    return user.add(
    {
      "nombre":nombreCompleto.toUpperCase(),
      "correo": nuevoUsuario.correo,
      "puntos":nuevoUsuario.puntosIniciales,
      "visitas": 0,
      "fecha_registro": Timestamp.now(),
    }
    ).then((value) {
      return value.id;
    });
  }
  //Crear un registro en la base de datos

  //Leer la base de datos

  // Leer la base de datos con filtro por busqueda
  //Leer la base de datos
  Stream<QuerySnapshot> getAllUsers(){
    final notesStream = 
    user.orderBy("fecha_registro", descending: true).snapshots();
    return notesStream;
  }
  Stream<DocumentSnapshot> getUserById(String docId,){
    final userData = user.doc(docId).snapshots();
   
    return userData;
  }

  Stream<QuerySnapshot> getUsersByParameter(String parameterName,) {
    
   final usersStream = user
      .where('correo', isGreaterThanOrEqualTo: parameterName)
      .where('correo', isLessThan: parameterName + 'z')
      .snapshots();
  return usersStream;
}



  //Leer la base de datos

  //actualizar la base de datos
  Future<void> actualizarNombre(String docId, String nuevoNombre) {
  return user.doc(docId).update({
    "nombre": nuevoNombre.toUpperCase(),
   
  });
}
 Future<void> actualizarApellido(String docId, String nuevoCorreo) {
  return user.doc(docId).update({
    "correo": nuevoCorreo.toUpperCase(),
   
  });
}
 Future<void> actualizarPuntos(String docId, double nuevosPuntos,) {
  return user.doc(docId).update({
  "puntos": nuevosPuntos,
  "ultima_actualizacion": Timestamp.now().toDate(),
  });
}
//agreagar visita
//actualizar la base de datos

 //eliminar datos base
  Future <void> eliminarUsuario(String docId){
    return user.doc(docId).delete();
    }
 //eliminar datos base   
}
