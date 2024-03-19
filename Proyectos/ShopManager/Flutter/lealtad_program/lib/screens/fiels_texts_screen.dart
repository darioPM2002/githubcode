import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lealtad_program/helpers/users.dart';
import 'package:lealtad_program/screens/user_screen.dart';
import 'package:lealtad_program/services/sql/firebase/firestore_service.dart';
import 'package:lealtad_program/theme/app_theme.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class FieldsTexts extends StatefulWidget {
  final UsuarioExistente user;
  const FieldsTexts({super.key, required this.user});

  @override
  State<FieldsTexts> createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<FieldsTexts> {
  @override
  void initState() {
    textControllerNombre.text= widget.user.nombre;
    textControllerCorreo.text= widget.user.correo;
    textControllerPuntos.text = widget.user.puntos.toString();
    visitas =widget.user.visitas;


    // TODO: implement initState
    super.initState();
  }
  final TextEditingController textControllerNombre = TextEditingController();
  
  final TextEditingController textControllerCorreo = TextEditingController();
  final TextEditingController textControllerPuntos =TextEditingController(text: "0.0");
  
  final TextEditingController textControllerPuntosVentas =TextEditingController(text: "0.0");
  
  final TextEditingController textControllerVenta =TextEditingController(text: "0.0");
   int visitas =0;

  bool todosLosCamposLlenos = false;

  void verificarCamposLlenos() {
    setState(() {
      
      todosLosCamposLlenos = [
        textControllerNombre,
 
        textControllerCorreo,
        textControllerPuntos,
      ].every((controller) => controller.text != null && controller.text != '');
    });
  }
  void ventaToPoints(){
    setState(() {
    double venta =double.parse(textControllerVenta.text);
    textControllerPuntosVentas.text = (venta *0.5).toString();
    });
   

  }
   void pointsToVenta(){
    setState(() {
    double puntos =double.parse(textControllerPuntosVentas.text);
    textControllerVenta.text = (puntos /0.5).toString();
    });
   

  }

  @override
  Widget build(BuildContext context) {

   
    final TextStyle textoHead = const TextStyle(
      fontSize: 30,
    );
    final FirestoreService firestoreService = FirestoreService();

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Text(widget.user.nombre,
              style: textoHead, textAlign: TextAlign.center),
          const SizedBox(height: 15),
          // Divider(thickness: 4),
          const SizedBox(height: 15),
          TextField(
            controller: textControllerNombre,
            onChanged: (value) => verificarCamposLlenos(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nombre',
              hintText: 'Ingresa el nombre',
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: textControllerCorreo,
            onChanged: (value) => verificarCamposLlenos(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Correo',
              hintText: 'Ingresa el correo',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: textControllerPuntos,
            onChanged: (value) => verificarCamposLlenos(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Puntos',
              hintText: 'Ingrese Puntos',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 80, child: TextField(
                
                textAlign: TextAlign.center,
            controller: textControllerVenta,
            onChanged: (value) {
              ventaToPoints();
           
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Venta \$',
              hintText: 'Ingrese Puntos',
            ),)),
              Text("="),
              SizedBox(width: 80, child: TextField(
                textAlign: TextAlign.center,
            controller: textControllerPuntosVentas,
            onChanged: (value) {
              pointsToVenta();
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Puntos',
              hintText: 'Ingrese Puntos',
            ),)),
              ElevatedButton(
                  onPressed: (
                  ) {
                    textControllerPuntos.text= (double.parse(textControllerPuntos.text)+double.parse(textControllerPuntosVentas.text)).toString();

                  }, child: Text("Agreaar Puntos"))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                       if (visitas>0) {
                      visitas--;
                    }
                    });
                   
                    
                  },
                  backgroundColor: AppTheme.dark5,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    visitas.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Visitas",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    setState(() {
                       visitas++;
                       print(visitas);
                    });
                      
                  },
                  backgroundColor: AppTheme.dark5,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          ),SizedBox(height: 10,),
         
          ElevatedButton(
            onPressed: todosLosCamposLlenos
                ? () async {
                    final UsuarioNuevo usuarioNuev = UsuarioNuevo(
                      nombre: textControllerNombre.text,
                      apellido: textControllerNombre.text,
                      correo: textControllerCorreo.text,
                      puntosIniciales: double.parse(textControllerPuntos.text),
                    );
                    firestoreService
                        .agregarUsuario(usuarioNuev)
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserScreen(userId: value)),
                            ));
                  }
                : null,
            child: const Text('Crear nuevo usuario'),
          ),
        ],
      ),
    );
  }
}
