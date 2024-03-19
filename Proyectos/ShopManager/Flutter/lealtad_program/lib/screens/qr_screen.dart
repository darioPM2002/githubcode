import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lealtad_program/screens/home_screen.dart';
import 'package:lealtad_program/screens/user_screen.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:lealtad_program/widgets/user_card.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Leer Qr"),),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
                
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Qr invalido, intente de nuevo', style: TextStyle(fontSize: 30),)
                  : Text('Acerca el dispositivo y scanee..',style: TextStyle(fontSize: 30)),
            ),)
        
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      List<String> contenidoQr =scanData.code!.split("_:");
      
      if ( contenidoQr.first =="qruserleal") {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserScreen(userId: contenidoQr[1],)));
            
       
        
      }else{
        print("leyendo fak");
      }
      setState(() {
        result = scanData;
      });

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}