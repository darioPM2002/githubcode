import 'package:flutter/material.dart';
import 'package:lealtad_program/helpers/mailer.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:lealtad_program/widgets/buttons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class DigitalID extends StatelessWidget {
   DigitalID({
    super.key,
 
    required this.user,
  });

  final UsuarioExistente user;
  
  @override
  Widget build(BuildContext context) {
    
    final ScreenshotController screenshotController =  ScreenshotController();
    final RoundedLoadingButtonController controladorButton = RoundedLoadingButtonController();
    final EmailSender email =EmailSender();
    return Column(
      children: [
        Screenshot(
          controller: screenshotController,
          child: Container(
            padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(color:AppTheme.dark3, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                
                
              


              
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(15), color: AppTheme.dark1,),
                    
                    child: const Icon(Icons.fingerprint, color:Colors.white, size: 80,)),
                    Container(
                      
                      child: Column(
                        children: [
                          const Text("ID Digital", style: TextStyle(color: Colors.white, fontSize: 30,  ),),
                          Text(user.nombre, style: const TextStyle(color: Colors.white, fontSize: 22),),
                      
                        ],
                      ),
                    ),
             
                    const SizedBox(
                  
                  width: 280,
                  child: Divider(thickness: 2 ,color: Colors.white, )),
                  
             Container(
               decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(15), color: AppTheme.dark1,),
               child: QrImageView(
                                 eyeStyle:  const QrEyeStyle(eyeShape: QrEyeShape.square, color:  AppTheme.dark1),
                               dataModuleStyle:  const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.circle, color: Colors.white) ,
                                 foregroundColor: Colors.white,
                                 data: "qruserleal_:${user.userId}",
                                 version: QrVersions.auto,
                                 size: 300,
                                 gapless: false,
                               ),
             ),
              
              ],
            ),
          ),
        ),
      const SizedBox(height: 10,),
    
  
        RoundedLoadingButton(
          width: 250,
          color: AppTheme.dark5,
          errorColor: Colors.red,
          successColor: Colors.green,
                  controller: controladorButton,
                  onPressed: () async {
                   screenshotController.captureAndSave(
                    (await getTemporaryDirectory()).path,  // Usa getTemporaryDirectory() para el directorio temporal           
                    fileName: "Credencial_Digital_${user.nombre}.png",
                  ).then((value) async{
      
              await email.sendEmail(
                user: user,   
                    imagePath: value!,
                    ).then((value) {
                      if (value ) {
                        controladorButton.success();
                      }else{
                        controladorButton.error();
                      }
                    });
                      
                      }
                   );
                     
                  },
                  child: const Text('Enviar ID a correo del usuario', style: TextStyle(color: Colors.white))
              ),const SizedBox(height: 5,),

                ElevatedButton(onPressed: ()async{
               screenshotController.captureAndSave(
            (await getTemporaryDirectory()).path,  
            fileName: "Credencial_Digital_${user.nombre}.png",
        ).then((value) {
          
           Share.shareXFiles([XFile(value!),]);
        });
      }, child: const Text("Compartir")),
      ],
    );
  }
}



