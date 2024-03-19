class UsuarioNuevo {
  
  final String nombre;
  final String apellido;
  final String correo;
  final double puntosIniciales;

  UsuarioNuevo({required this.nombre, required this.apellido, required this.correo,  required this.puntosIniciales});
}

class UsuarioExistente {
  final String nombre;
  final String userId;
  final String correo;
  final double    puntos;
  final int    visitas;
  UsuarioExistente( {required this.visitas,required this.nombre, required this.userId, required this.correo, required this.puntos});

}