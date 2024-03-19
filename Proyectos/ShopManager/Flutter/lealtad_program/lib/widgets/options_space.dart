import 'package:flutter/material.dart';
import 'package:lealtad_program/screens/qr_screen.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:lealtad_program/widgets/new_user_screen.dart';
class OptionsSpace extends StatelessWidget {
  const OptionsSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: AppTheme.dark3
    , width: double.infinity, height: MediaQuery.of(context).size.height*0.35,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _botonNewUser(),
        _botonQr(),
      ],),
    ),
    );
  }
}

class _botonNewUser extends StatelessWidget {
  const _botonNewUser({super.key});

  @override
  Widget build(BuildContext context) {
   void openNoteBox (){
  showDialog(context: context, builder: (context) => AlertDialog(
    content: CreateNewUser(),
    actions: [ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text("Cancelar"))],
  ),);
} 
  return InkWell(
    onTap: () {
      openNoteBox();
    },
    splashColor: Colors.grey,
    child: Container(
      width: 170,
      height: 170,
      child: Material(
        color: Colors.transparent,
        child: Card(
          margin: const EdgeInsets.all(20),
          color: const Color.fromRGBO(187, 134, 252, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 10,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_alt_rounded, color: Colors.white, size: 40),
              Text(
                "Nuevo Usuario",
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ],
          ),
        ),
      ),
    ), // Cambia esto al color que desees para el efecto de sombra
  );
  }}

class _botonQr extends StatelessWidget {
  const _botonQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openNoteBox() {
      showDialog(
        context: context,
        builder: (context) => QRViewExample(), // Usar CustomDialog en lugar de AlertDialog
      );
    }

    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) {
        return QRViewExample();
      },
        );  
      },
      splashColor: Colors.grey.withOpacity(0.5),
      child: Container(
        width: 170,
        height: 170,
        child: Material(
          color: Colors.transparent,
          child: Card(
            margin: const EdgeInsets.all(20),
            color: const Color.fromRGBO(187, 134, 252, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 10,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_scanner_rounded, color: Colors.white, size: 40),
                Text(
                  "Leer QR",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


