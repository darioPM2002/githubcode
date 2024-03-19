import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lealtad_program/helpers/mailer.dart';
import 'package:lealtad_program/helpers/mapper.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/screens/fiels_texts_screen.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:lealtad_program/widgets/buttons.dart';
import 'package:lealtad_program/widgets/digital_id.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';


class UserScreen extends StatelessWidget {
  final String userId;

  UserScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController =  ScreenshotController();
    final EmailSender email =EmailSender();
    FirestoreService firestoreService = FirestoreService();
    return StreamBuilder<DocumentSnapshot>(
      stream: firestoreService.getUserById(userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Obtener los datos del documento
           final userData = snapshot.data!.data() as Map<String, dynamic>;
            UsuarioExistente user =Mapper.mapToUser(snapshot.data!);
          // Crear una pantalla con los valores obtenidos
          return RepaintBoundary(
  key: GlobalKey(),
  child: Scaffold(
    appBar: AppBar(
      title: Text(userData['nombre']),
    ),
    body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
     FieldsTexts(user: user,),
      SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: Divider(thickness: 3,)),
      DigitalID(user: user),
      SizedBox(height: 15,),
      DeleteButtonAcount(user: user),
      SizedBox(height: 15,),
    
      // Otros widgets si es necesario
    ],
  ),
)

  ),
);

        } else if (snapshot.hasError) {
          return Center(child: Text("Este usuario no existe"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }}

   String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Future<void> _launchUrl() async {

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'a01785420@tec.mx',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!',

   
    }),
  );
  if (!await launchUrl(emailLaunchUri,mode: LaunchMode.externalApplication)) {
    print("Could not launch");
    //throw Exception('Could not launch $emailLaunchUri');
  }
}

Future<Uint8List> loadAndConvertAssetImage(String assetPath) async {
  // Cargar la imagen desde los activos
  ByteData data = await rootBundle.load(assetPath);
  List<int> bytes = data.buffer.asUint8List();

  // Decodificar la imagen utilizando el paquete 'image'
  img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;

  // Codificar nuevamente la imagen a un formato compatible (puedes ajustar el formato según tus necesidades)
  //img.Format format = img.8 // Puedes cambiar a img.Png() si prefieres PNG
  Uint8List encodedBytes = img.encodeJpg(image); // Cambia a encodePng si estás usando PNG

  return encodedBytes;
}


Future<void> _launchUrlWithImage( Uint8List imagegenUin) async {
  // Obtén la imagen en formato Uint8List (reemplaza esto con tu lógica)

  // Convierte la imagen a Base64
  String base64Image = base64Encode(imagegenUin);
// Construye la URL del correo electrónico con la imagen codificada en Base64
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'a01785420@tec.mx',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Example Subject & Symbols are allowed!',
      //:</p><img src="data:image/png;base64, $base64Image">
     //'body': '<!DOCTYPE html><html><head><title>Imagen</title></head><body><h1>Imagen</h1><p>Adjuntando imagen:</p><img src="data:image/png;base64, BASE64_CODE_AQUI" alt="base64Image"></body></html>',
     //"attachments": "$base64Image"
    }),
  );

  // Lanza la aplicación de correo electrónico externa
  if (!await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication)) {
    print("Could not launch");
  }
}

Future<Uint8List> getImageBytes() async {
  // Aquí deberías cargar tus bytes de la imagen, ya sea desde la red o desde un archivo local.
  // En este ejemplo, estoy utilizando un archivo de imagen local.
  // Reemplaza esto con tu lógica para obtener la imagen.
  // String imagePath = 'path/to/your/image.png';
  // File imageFile = File(imagePath);
  // return await imageFile.readAsBytes();

  // Ejemplo con una imagen de asset
  // Asegúrate de tener la imagen en la carpeta 'assets' y configurada en pubspec.yaml
  ByteData data = await rootBundle.load('assets/favicon.png');
  return data.buffer.asUint8List();
}

