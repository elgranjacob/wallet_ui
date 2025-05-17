// Importa el paquete principal de Flutter
import 'package:flutter/material.dart';

// Widget sin estado que representa un botón personalizado con ícono y texto
class MyButton extends StatelessWidget {

  // Ruta de la imagen del ícono
  final String iconImagePath;

  // Texto que aparecerá debajo del ícono
  final String buttonText;

  // Constructor con parámetros requeridos y clave opcional
  const MyButton({
    super.key,
    required this.iconImagePath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column( // Organiza el contenido verticalmente
      children: [
        // Contenedor para el ícono
        Container(
          height: 90, // Altura del contenedor
          padding: EdgeInsets.all(20), // Espaciado interno
          decoration: BoxDecoration(
            // Fondo comentado (se puede activar si se desea un color claro)
            // color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20), // Bordes redondeados

            // Sombra blanca suave que genera efecto de relieve
            boxShadow: [
              BoxShadow(
                color: Colors.white, // Color de la sombra
                blurRadius: 30,      // Difuminado
                spreadRadius: 10,    // Extensión de la sombra
              ),
            ],
          ),
          child: Center(
            // Muestra la imagen del ícono centrada
            child: Image.asset(iconImagePath),
          ),
        ),

        SizedBox(height: 10), // Espacio entre ícono y texto

        // Texto debajo del ícono
        Text(
          buttonText, // Muestra el texto recibido por parámetro
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.grey[700], // Color gris oscuro
          ),
        ),
      ],
    );
  }
}
