import 'package:flutter/material.dart';
import 'package:lealtad_program/theme/app_theme.dart';
class Bar extends StatelessWidget {
  const Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container
      (
        
        child: Padding(
          padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.2),
          child: Row(
            children: [
               Text("Cliente", style: TextStyle(color: Colors.white), ),
               Spacer(),
               Text("Puntos", style: TextStyle(color: Colors.white), ),
             
               ]),
        ),
        padding: EdgeInsets.only(left: 20),
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
     color: AppTheme.dark5,
     borderRadius: BorderRadius.circular(5),
        ),));
  }
}