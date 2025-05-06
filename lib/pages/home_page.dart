import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/utils/my_card.dart';

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
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800
              ),
            )
            //3 buttons -> send + pay + bills

            //column -> stats + transaction
          ],
        ),
      ),
    );
  }
}
