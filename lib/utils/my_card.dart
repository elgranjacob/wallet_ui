// Importa la librería principal de Flutter para construir widgets
import 'package:flutter/material.dart';

// Widget sin estado que representa una tarjeta bancaria personalizada
class MyCard extends StatelessWidget {
  // Propiedades necesarias para mostrar los datos de la tarjeta
  final double balance;         // Saldo actual
  final int cardNumber;         // Número de tarjeta
  final int expiryMonth;        // Mes de expiración
  final int expiryYear;         // Año de expiración
  final color;                  // Color de fondo de la tarjeta

  // Constructor con parámetros requeridos
  const MyCard({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Agrega espacio lateral para separar las tarjetas
      padding: const EdgeInsets.symmetric(horizontal: 25),

      // Contenedor principal de la tarjeta
      child: Container(
        width: 300,           // Ancho fijo de la tarjeta
        padding: EdgeInsets.all(20), // Relleno interno
        decoration: BoxDecoration(
          color: color,       // Color de fondo recibido por parámetro
          borderRadius: BorderRadius.circular(16), // Bordes redondeados
        ),

        // Contenido de la tarjeta organizado en columna
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye verticalmente

          children: [
            // Fila superior: texto "Balance" y logo de tarjeta
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separación entre elementos
              children: [
                Text(
                  'Balance',
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                  ),
                ),
                // Imagen del logo de tarjeta (visa, mastercard, etc.)
                Image.asset(
                  "visa",       // ⚠️ Falta extensión: debería ser "assets/images/visa.png" o similar
                  height: 60,
                )
              ],
            ),

            // Monto del balance
            Text(
              '\$' + balance.toString(), // Convierte el saldo a string y lo concatena con "$"
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30), // Espacio entre monto y parte inferior

            // Fila inferior: número de tarjeta y fecha de expiración
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Número de tarjeta
                Text(
                  cardNumber.toString(), // Convierte a string
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                // Fecha de expiración (MM/YY)
                Text(
                  expiryMonth.toString() + '/' + expiryYear.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
