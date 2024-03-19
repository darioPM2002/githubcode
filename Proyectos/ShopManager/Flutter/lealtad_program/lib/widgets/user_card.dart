import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lealtad_program/helpers/mapper.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/screens/user_screen.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';



class CardUser extends StatefulWidget {
  final UsuarioExistente usuario;

  const CardUser({
    super.key, required this.usuario,
  });

  @override
  State<CardUser> createState() => _CardUserState();
}

class  _CardUserState extends State<CardUser> {


  @override
  Widget build(BuildContext context) {
   return Column(
  children: [
    ListTile(
      title: Text(widget.usuario.nombre, style: TextStyle(color: Colors.white),),
      subtitle: Text(widget.usuario.correo),
      // leading: Icon(Icons.arrow_back_ios_outlined),
      trailing: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.2),
        child: Text(widget.usuario.puntos.toString()),
      ),
      isThreeLine: true,
      onTap: () => showDialog(context: context, builder: (context) {
        return UserScreen(userId: widget.usuario.userId);
      },),
    ),
    Divider(thickness: 2, indent: 10, endIndent: 10),
    
  ],
);

  }
}



