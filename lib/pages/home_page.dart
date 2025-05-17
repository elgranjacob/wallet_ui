// Importa la biblioteca principal de Flutter
import 'package:flutter/material.dart';

// Importa el paquete para mostrar indicadores animados en PageView
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Importa el botón personalizado que se usa para las acciones (send, pay, bills)
import 'package:wallet_ui/utils/my_button.dart';

// Importa la tarjeta bancaria personalizada
import 'package:wallet_ui/utils/my_card.dart';

// Importa el componente de lista para estadísticas y transacciones
import 'package:wallet_ui/utils/my_list_tile.dart';

// Define un widget con estado llamado HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Constructor del widget

  @override
  State<HomePage> createState() => _HomePageState(); // Crea el estado
}

// Clase del estado del widget HomePage
class _HomePageState extends State<HomePage> {
  // Controlador para controlar el PageView de las tarjetas
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Fondo gris claro de toda la pantalla

      // Botón flotante principal (ícono de dinero)
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Acción al presionar (vacía por ahora)
        backgroundColor: Colors.pink, // Color de fondo del botón
        child: Icon(Icons.monetization_on, size: 32), // Ícono de dinero
      ),

      // Posición del botón flotante (centrado y acoplado en la barra inferior)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Barra inferior personalizada
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200], // Color de fondo de la barra inferior
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0), // Espaciado superior interno
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribuye los íconos
            children: [
              // Botón de inicio (icono rosado activo)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, size: 32, color: Colors.pink[200]),
              ),
              // Botón de configuración (icono gris)
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, size: 32, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),

      // Contenido principal del cuerpo
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado con título y botón "+"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinea entre extremos
                children: [
                  // Título "My cards"
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  // Botón circular con ícono "+"
                  Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[400], // Fondo gris
                      shape: BoxShape.circle, // Forma circular
                    ),
                    child: Icon(Icons.add), // Ícono "+"
                  ),
                ],
              ),
            ),

            SizedBox(height: 25), // Espacio vertical

            // Contenedor para el carrusel de tarjetas bancarias
            Container(
              height: 200, // Altura del carrusel
              child: PageView(
                controller: _controller, // Asigna el controlador
                scrollDirection: Axis.horizontal, // Dirección horizontal
                children: [
                  // Tarjeta 1
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 122332978,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.deepPurple[300],
                  ),
                  // Tarjeta 2
                  MyCard(
                    balance: 2340.24,
                    cardNumber: 122332978,
                    expiryMonth: 12,
                    expiryYear: 26,
                    color: Colors.blue[300],
                  ),
                  // Tarjeta 3
                  MyCard(
                    balance: 1350.12,
                    cardNumber: 122332978,
                    expiryMonth: 9,
                    expiryYear: 27,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25), // Espaciado

            // Indicador animado de páginas (dots debajo del carrusel)
            SmoothPageIndicator(
              controller: _controller, // Conecta con el PageView
              count: 3, // Número de páginas
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800, // Color del punto activo
              ),
            ),

            SizedBox(height: 20), // Espacio entre secciones

            // Fila de 3 botones: Send, Bills, Pay
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye los botones
                children: [
                  MyButton(iconImagePath: "lib/icons/send.png", buttonText: "Send"),
                  MyButton(iconImagePath: "lib/icons/bills.png", buttonText: "Bills"),
                  MyButton(iconImagePath: "lib/icons/pay.png", buttonText: "Pay"),
                ],
              ),
            ),

            SizedBox(height: 40), // Espacio antes de la siguiente sección

            // Columna con dos ítems de lista: Statistics y Transaction
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // Elemento de lista: Statistics
                  MyListTile(
                    iconImagePath: "lib/icons/estadisticas.png",
                    tileTitle: "Statistics",
                    tileSubTitle: "Payments and Income",
                  ),
                  // Elemento de lista: Transaction
                  MyListTile(
                    iconImagePath: "lib/icons/transaction.png",
                    tileTitle: "Transaction",
                    tileSubTitle: "Transaction History",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
