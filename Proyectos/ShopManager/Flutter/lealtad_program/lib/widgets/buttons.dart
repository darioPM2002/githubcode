import 'package:flutter/material.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';



class DeleteButtonAcount extends StatelessWidget {
  const DeleteButtonAcount({
    super.key,
    required this.user,
  });

  final UsuarioExistente user;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("¿Seguro que quieres eliminar esta cuenta?",style: TextStyle(fontSize: 18),),
        actions: [
        TextButton(
          style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
      
          ),
          onPressed: (){
          FirestoreService firestore =FirestoreService();
          firestore.eliminarUsuario(user.userId);
          //Navigator.pop(context);
          //Navigator.pop(context);
        }, child: Text("Confirmar",style: TextStyle(color: Colors.white), )),
        TextButton(
         
          onPressed: (){
          Navigator.pop(context);
        
        }, child: Text("Cancelar",style: TextStyle(color: Colors.white), )),
        ]),);
    },
     child: Text("Eliminar cuenta", style: TextStyle(color: Colors.white),),
     style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
      
      ), );
  }
}


