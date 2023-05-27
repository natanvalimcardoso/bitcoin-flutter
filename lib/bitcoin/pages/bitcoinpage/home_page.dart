import 'package:flutter/material.dart';

import '../../bitcoin_controller.dart';
import 'bitcoin_dois_page.dart';
import 'bitcoin_um_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bitcoinController = BitcoinController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Bitcoin Home'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.money),
                  text: 'Bitcoin Um',
                ),
                Tab(
                  icon: Icon(Icons.monetization_on),
                  text: 'Bitcoin Dois',
                ),
              ],
            )),
        body: TabBarView(
          children: [
            BitcoinUmPage(bitcoinController: bitcoinController),
            BitcoinDoisPage(bitcoinController: bitcoinController),
          ],
        ),
      ),
    );
  }
}
