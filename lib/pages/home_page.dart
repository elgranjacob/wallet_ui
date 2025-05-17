import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/utils/my_button.dart';
import 'package:wallet_ui/utils/my_card.dart';
import 'package:wallet_ui/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.monetization_on, size: 32,),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 32, color: Colors.pink[200],)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 32, color: Colors.grey,)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  //plus button
                  Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[400], shape: BoxShape.circle),
                      child: Icon(Icons.add))
                ],
              ),
            ),
            SizedBox(height: 25),
            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 122332978,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 2340.24,
                    cardNumber: 122332978,
                    expiryMonth: 12,
                    expiryYear: 26,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 1350.12,
                    cardNumber: 122332978,
                    expiryMonth: 09,
                    expiryYear: 227,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
            ),

            SizedBox(height: 20),
            //3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(iconImagePath: "lib/icons/send.png", buttonText: "Send"),
                  // bill button
                  MyButton(iconImagePath: "lib/icons/bills.png", buttonText: "Bills"),
                  // pay button
                  MyButton(iconImagePath: "lib/icons/pay.png", buttonText: "Pay")
                ],
              ),
            ),

            SizedBox(height: 40),

            //column -> stats + transaction
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // statics
                  MyListTile(iconImagePath: "lib/icons/estadisticas.png", tileTitle: "Statistics", tileSubTitle: "Payments and Icome"),
                  // transaction
                  MyListTile(iconImagePath: "lib/icons/transaction.png", tileTitle: "Transaction", tileSubTitle: "Transaction History")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
