import 'dart:io';
import 'dart:io';
import 'package:lealtad_program/helpers/users.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


class EmailSender {
  Future<bool> sendEmail({
    required UsuarioExistente user,
    
    required String imagePath,
  }) async {
   print("Intentando mandar correo.. ");
   final subject= "ID DIGITAL";
   final String correo_empresa ="daripm2@gmail.com";
 String htmlMess = '''
 <html>
  <head>
    <style>
      body {
        background-color: black;
        color: white;
        font-family: 'Arial', sans-serif;
        text-align: center; /* Centra todo el contenido */
        padding: 20px;
      }

      h1 {
        color: #FFD700;
      }

      p {
        font-size: 18px;
        line-height: 1.5;
      }

      img {
        padding: 20px;
        max-width: 60%; /* Ajusta el tamaño máximo de la imagen (60% del ancho) */
        height: auto; /* Mantiene la proporción de la imagen al ajustar el ancho */
        display: block; /* Elimina cualquier espacio adicional alrededor de la imagen */
        margin: 0 auto; /* Centra la imagen horizontalmente */
        vertical-align: middle; /* Centra verticalmente la imagen */
      }

      .disclaimer {
        margin-top: 20px;
        font-size: 14px;
      }
    </style>
  </head>
  <body>
    <h1>Generador de Tarjetas</h1>
    <p>
      Hola ${user.nombre} Bienvenido al programa de lealtad. Esta es tu tarjeta virtual para acumular puntos por cada compra.
      ¡Te esperamos con ansias!
    </p>
    <img src="cid:imagen_cid" alt="Tarjeta Virtual">
    <p class="disclaimer">No respondas este correo</p>
  </body>
</html>


''';

 //   Configura el servidor SMTP de Outlook manualmente
   // final smtpServer = await SmtpServer(
   //  'smtp-mail.outlook.com',
   //  username: fromEmail,
   //  password: "igneyfraszymtpco",
   //  ssl: true,
   //  port: 587,
//
   // );
   final smtpServer = await gmail(correo_empresa, "ryul fzcm dsab dwpz");
final messageHtml = Message()
  ..from = Address("daripm2@gmail.com", 'Dario peña')
  ..recipients.add(user.correo)
  ..subject = subject
  ..html =
   htmlMess;
//  '<p>$message</p><img src="cid:imagen_cid">';

// Puedes agregar la imagen como un adjunto en la sección de "attachments"
messageHtml.attachments.add(FileAttachment(    
File(imagePath))
  ..cid = '<imagen_cid>');

    try {
      final sendReport = await send(messageHtml, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      
      print('Message not sent. ${e.message}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
  }
}
