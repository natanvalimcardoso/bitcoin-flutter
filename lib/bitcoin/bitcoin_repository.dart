import 'package:dio/dio.dart';

class BitcoinRepository {
  final _dio = Dio();

  fetchBitcoinPrice(String? currency) async {
    final response = await _dio.get('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=$currency');
    if (response.statusCode == 200) {
      final json = response.data;

      var value = json['bitcoin'][currency];
      print(value);
      return json['bitcoin'][currency];
    } else {
      throw Exception('Erro ao buscar preço do Bitcoin');
    }
  }
}
