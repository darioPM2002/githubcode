import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lealtad_program/firebase_options.dart';
import 'package:lealtad_program/screens/home_screen.dart';
import 'package:lealtad_program/screens/qr_screen.dart';
import 'package:lealtad_program/theme/app_theme.dart';

void main() async{
   //PASO IMPORTANTE ANTES DE NADA PONER ESTAS LINEAS PARA QUE FIREBASE SE INICIALICE igual poner asyn al  main
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
   runApp(const ProviderScope(child: MyApp()));}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppTheme().getDarkTheme(),
      title: 'Material App',
      home: HomeScreen()


    );
  }
}
