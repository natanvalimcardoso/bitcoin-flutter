import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../bitcoin_controller.dart';

class BitcoinDoisPage extends StatefulWidget {
  final BitcoinController? bitcoinController;
  const BitcoinDoisPage({Key? key, this.bitcoinController}) : super(key: key);

  @override
  State<BitcoinDoisPage> createState() => _BitcoinDoisPageState();
}

class _BitcoinDoisPageState extends State<BitcoinDoisPage> {
  final TextEditingController _textEditingController = TextEditingController();

  double? _convertedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 150,
              child: Image.asset('assets/images/dolares.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            FutureBuilder(
              future: widget.bitcoinController?.convertCurrencyForBitcoin(_convertedValue ?? 0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final valueFormatted = (snapshot.data as num?)?.toStringAsFixed(2);
                  
                  return Text(
                    '${_textEditingController.text} BTC = $valueFormatted Dólares',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(16.0),
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
