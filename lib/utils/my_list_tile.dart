// Importa la biblioteca principal de Flutter para construir la interfaz
import 'package:flutter/material.dart';

// Widget sin estado que representa una fila de contenido tipo "tile" personalizada
class MyListTile extends StatelessWidget {

  // Ruta del ícono a mostrar
  final String iconImagePath;

  // Título principal del tile
  final String tileTitle;

  // Subtítulo del tile
  final String tileSubTitle;

  // Constructor con parámetros requeridos
  const MyListTile({
    super.key,
    required this.iconImagePath,
    required this.tileTitle,
    required this.tileSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Espaciado inferior entre tiles
      padding: const EdgeInsets.only(bottom: 20.0),

      // Fila que organiza ícono + textos + flecha
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los elementos en línea

        children: [
          // Contenedor del ícono
          Container(
            height: 80, // Altura del contenedor
            padding: EdgeInsets.all(12), // Espacio interno

            // Decoración: fondo gris claro y bordes redondeados
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),

            // Imagen del ícono que se carga desde la ruta
            child: Image.asset(iconImagePath),
          ),

          
          SizedBox(height: 20),

          // Columna con título y subtítulo del tile
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda
            children: [
              // Título del tile
              Text(
                tileTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 8), // Espaciado entre título y subtítulo

              // Subtítulo del tile
              Text(
                tileSubTitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),

          // Ícono de flecha al final (indica navegación)
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
