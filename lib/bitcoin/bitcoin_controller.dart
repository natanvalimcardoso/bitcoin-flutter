import 'package:bitcoin_flutter_ramon/bitcoin/bitcoin_repository.dart';

class BitcoinController {
  final BitcoinRepository _bitcoinRepository = BitcoinRepository();

  fetchBitcoin(String? currency) async {
    var value = await _bitcoinRepository.fetchBitcoinPrice(currency ?? 'brl');
    return value;
  }

  convertCurrencyForBitcoin(double numberBitcoin) async {
    var bitcoinValue = await _bitcoinRepository.fetchBitcoinPrice('usd');
    var value = bitcoinValue * numberBitcoin;
    return value;
  }
}
