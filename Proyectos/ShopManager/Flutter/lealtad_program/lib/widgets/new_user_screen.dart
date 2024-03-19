import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/screens/user_screen.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';


class CreateNewUser extends StatefulWidget {
  const CreateNewUser({super.key});

  @override
  State<CreateNewUser> createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
    final TextEditingController textControllerNombre = TextEditingController();
  final TextEditingController textControllerApellido = TextEditingController();
  final TextEditingController textControllerCorreo = TextEditingController();
  final TextEditingController textControllerPuntos = TextEditingController(text: "0.0");

  bool todosLosCamposLlenos = false;

  void verificarCamposLlenos() {
    setState(() {
      todosLosCamposLlenos = [
        textControllerNombre,
        textControllerApellido,
        textControllerCorreo,
        textControllerPuntos,
      ].every((controller) => controller.text != null && controller.text != '');
    });
  }

  @override
  Widget build(BuildContext context) {
     final TextStyle textoHead = const TextStyle(fontSize: 30, );
    final FirestoreService firestoreService = FirestoreService();

    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      height: MediaQuery.of(context).size.height*0.8,
      child: SingleChildScrollView(child: Column(children: [
        
              Text("Crear nuevo usuario", style: textoHead, textAlign: TextAlign.center),
              const SizedBox(height: 15),
             // Divider(thickness: 4),
              const SizedBox(height: 15),
              TextField(
                controller: textControllerNombre,
                onChanged: (value) => verificarCamposLlenos(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre (Sólo 1 nombre)',
                  hintText: 'Ingresa el primer nombre',
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: textControllerApellido,
                onChanged: (value) => verificarCamposLlenos(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Appellido (Sólo 1 apellido)',
                  hintText: 'Ingresa el primer apellido',
                ),
              ),const SizedBox(height: 10,),
              TextField(
                controller: textControllerCorreo,
                onChanged: (value) => verificarCamposLlenos(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                  hintText: 'Ingresa el correo',
                ),
              ),const SizedBox(height: 10,),
              TextField(
                controller: textControllerPuntos,
                onChanged: (value) => verificarCamposLlenos(),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
                decoration: const InputDecoration(
                  
                  border: OutlineInputBorder(),
                  labelText: 'Puntos iniciales',
                  hintText: 'Ingrese Puntos',
                ),
              ),const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: todosLosCamposLlenos
                    ? () async {
                        final UsuarioNuevo usuarioNuev = UsuarioNuevo(
                          nombre: textControllerNombre.text,
                          apellido: textControllerApellido.text,
                          correo: textControllerCorreo.text,
                          puntosIniciales: double.parse(textControllerPuntos.text),
                        );
                        firestoreService
                            .agregarUsuario(usuarioNuev)
                            .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UserScreen(userId: value)),
                                ));
                      }
                    : null,
                child: const Text('Crear nuevo usuario'),
              ),
      ],),),
    );
  }
}