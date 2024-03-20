import 'package:flutter/material.dart';
import 'package:shop_manager/Domain/dataFunctions/isar_functions.dart';
import 'package:shop_manager/Domain/datasources/dio_peticiones.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconSize = size.width*.15 + size.height*.2;
    return  Scaffold(
      body:Container( width: size.width, height: size.height,
      child: Stack(
        children: [
          CircleScreen(size: size),
          Positioned(child: IconButton(onPressed: (){}, icon: Icon(Icons.help_outline_rounded, ), )),
          Positioned(
            left: 0,
            child: SizedBox(
              width: size.width*.5,
              height: size.height,              
              child:  Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 5),
                  Text("Ingresa Colaborador", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),), 
                  SizedBox(height: size.height*0.02,),
                  CustomTextfield(size: size,hintText: "Usuario"),
                  SizedBox(height: size.height*0.02,),
                  CustomTextfield(size: size, hintText: "Contraseña"),
                  SizedBox(height: size.height*0.02,),
                  BotonNi(isWhite: false),
                  Spacer(flex: 5),
              ],),
            )),
           Positioned(
            right: 0,
           
            child: SizedBox(
             
              width: size.width*.5,
              height: size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Spacer(flex: 5),
                  Text("Ingresa Administrador", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),), 
                  SizedBox(height: size.height*0.02,),
                  CustomTextfield(size: size, hintText: "Usuario"),
                  SizedBox(height: size.height*0.02,),
                  CustomTextfield(size: size, hintText: "Contraseña",),
                  SizedBox(height: size.height*0.02,),
                  BotonNi(isWhite: true),
                  Spacer(flex: 5),

              ],),
            )),  
        ],
      ),)
    );
  }
}

class CustomTextfield extends StatelessWidget {
  final String hintText;
  const CustomTextfield({
    super.key,
    required this.size, required this.hintText,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size.width * .2, child: TextField(decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200], // Color de fondo gris
                    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
    borderSide: BorderSide.none, // Sin bordes marcados
                    ),
                    hintText: hintText, // Texto de sugerencia
                  ),));
  }
}

class BotonNi extends StatelessWidget {
  final bool isWhite;
  const BotonNi({
    super.key, required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
   BorderSide mySide =BorderSide.none;
    if (isWhite) {
      mySide = BorderSide(color: Colors.white);
    }
    return ElevatedButton(

      
     style:  ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                 side: mySide, 
                borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                ),
                backgroundColor:  Color.fromRGBO(86, 72, 181, 1, ), // Color de fondo morado
              ),
     onPressed: (){
      descargarProducts();
      getHttp();

     }, child:Text("Ingresar ",style: TextStyle( fontWeight: FontWeight.w500, color: Colors.white),));
  }
}
//Container(width: 100, height: 100, color: Colors.red,)
class CircleScreen extends StatelessWidget {
  const CircleScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      right: 0,
      child: Container(

        decoration: 

        BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.elliptical(size.width*.25, size.height*.3),bottomLeft: Radius.elliptical(size.width*.1, size.height*.2) ),
          color: Color.fromRGBO(86, 72, 181, 1, ),),
        width: size.width*.5, height: size.height, ));
  }
}