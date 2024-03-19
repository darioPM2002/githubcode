import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lealtad_program/helpers/mapper.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';
import 'package:lealtad_program/services/sql/firebase/providers/text_provider.dart';
import 'package:lealtad_program/widgets/app_barr.dart';
import 'package:lealtad_program/widgets/options_space.dart';
import 'package:lealtad_program/widgets/user_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final TextEditingController searchController = TextEditingController();
    FirestoreService firestoreService = FirestoreService();
     String valor ="";
    return Scaffold(
      appBar: AppBar(
        
        title:      SizedBox(
              width: 1000, // Ajusta el ancho del TextField según tus necesidades
              child: TextField(
            
                onChanged: (value) {
                  valor=value;
                  // Lógica para manejar cambios en el texto del TextField
                  // Puedes realizar búsquedas en tiempo real o ajustar la lógica según sea necesario
                  // Ejemplo: firestoreService.getUsersByParameter(value);
                },
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  border: InputBorder.none,
                ),
              ),
            ),
        actions: [
          
                 IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
             ref.watch(textEditingController.notifier).update((state) =>TextEditingController(text: valor));
              // Realiza la búsqueda con el valor actual del controlador de texto
             
            },
          ),
        ],
      ),
     
      body: ListaBuscados(
        firestoreService: firestoreService,
        searchController: searchController,
      ),
    );
  }
}

class ListaBuscados extends ConsumerWidget {
  const ListaBuscados({
    super.key,
    required this.firestoreService,
    required this.searchController,
  });

  final FirestoreService firestoreService;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final TextEditingController searchControllerb = ref.watch(textEditingController);
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getUsersByParameter(searchControllerb.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List userList = snapshot.data!.docs;

          return Column(
            children: [
              Bar(),
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = userList[index];
                    final usuario = Mapper.mapToUser(document);
                    return CardUser(usuario: usuario);
                  },
                ),
              ),
              OptionsSpace()
            ],
          );
        } else {
          return Text("No hay notas creadas");
        }
      },
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.firestoreService,
    required this.usuario,
  });

  final FirestoreService firestoreService;
  final UsuarioExistente usuario;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      showDialog(context: context, builder:
      (context) => AlertDialog(
        content: Text("¡Deseas elimiar la cuenta?", ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child:  Text("Cancelar", ),),
           TextButton(onPressed: (){firestoreService.eliminarUsuario(usuario.userId);Navigator.pop(context);Navigator.pop(context);}, child:  Text("Confirmar", style: TextStyle(color: Colors.red),),)
         ],
      ));
    }, child: Text("Eliminar cuenta", style: TextStyle(color: Colors.red),),);
  }
}



  