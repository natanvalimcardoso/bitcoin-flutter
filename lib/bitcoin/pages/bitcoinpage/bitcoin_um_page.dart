import 'package:flutter/material.dart';
import '../../bitcoin_controller.dart';

class BitcoinUmPage extends StatefulWidget {
  final BitcoinController? bitcoinController;

  const BitcoinUmPage({Key? key, this.bitcoinController}) : super(key: key);

  @override
  State<BitcoinUmPage> createState() => _BitcoinUmPageState();
}

class _BitcoinUmPageState extends State<BitcoinUmPage> {
  String? _selectedCurrency;

  List<String> currenciesList = [
    'brl',
    'usd',
    'eur',
    'cny',
    'gbp',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 150,
            child: Image.asset('assets/images/bitcoin.png'),
          ),
          const SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: widget.bitcoinController?.fetchBitcoin(_selectedCurrency ?? 'BRL'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '1 BTC = ${snapshot.data} $_selectedCurrency',
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                );
              } else if (snapshot.hasError) {
                return const Text(
                  'Erro ao buscar o valor do Bitcoin',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                );
              } else {
                return const Text('Escolha uma moeda', style: TextStyle(fontSize: 20));
              }
            },
          ),
          const SizedBox(
            height: 190,
          ),
          Container(
            width: double.infinity, // Largura desejada
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: DropdownButton<String>(
              value: _selectedCurrency,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              onChanged: (newValue) {
                setState(() {
                  _selectedCurrency = newValue;
                });
              },
              items: currenciesList.map(
                (currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(currency),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
