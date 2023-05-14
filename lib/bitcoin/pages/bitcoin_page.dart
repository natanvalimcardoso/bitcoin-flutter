import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bitcoin_controller.dart';

class BitcoinPage extends StatefulWidget {
  BitcoinPage({Key? key}) : super(key: key);

  @override
  State<BitcoinPage> createState() => _BitcoinPageState();
}

class _BitcoinPageState extends State<BitcoinPage> {
  TextEditingController _textEditingController = TextEditingController();
  double? _convertedValue;
  String? _selectedCurrency;

  List<String> currenciesList = [
    'brl',
    'usd',
    'eur',
    'cny',
  ];

  final bitcoinController = BitcoinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: bitcoinController.fetchBitcoin(_selectedCurrency ?? 'BRL'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '1 BTC = ${snapshot.data} ${_selectedCurrency ?? 'BRL'}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Erro ao buscar o valor do Bitcoin',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const Text('Escolha uma moeda');
                }
              },
            ),
            DropdownButton<String>(
              value: _selectedCurrency,
              items: currenciesList.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCurrency = newValue;
                });
              },
            ),

            //* -------------------------- OTHER WAY --------------------------//

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Divider(
                thickness: 2,
                color: Colors.black54,
              ),
            ),

            //* -------------------------- OTHER WAY --------------------------//
            FutureBuilder(
              future: bitcoinController.convertCurrencyForBitcoin(_convertedValue ?? 0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${_textEditingController.text} BTC = ${snapshot.data} Dólares',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Erro ao buscar o valor do Bitcoin',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const Text('Escolha uma moeda');
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,8}')),
                ],
                decoration: InputDecoration(
                  labelText: 'Digite uma quantidade de bitcoin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Calcular'),
              onPressed: () {
                setState(
                  () {
                    _convertedValue = double.parse(_textEditingController.text);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
