import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talentscode/models/stock_model.dart';

class ApiStocks {
  /* Find Objext */
  Future<Map<String, StockDays>> stockInfo(String symbol) async {
    /*api URL set up */

    Uri uriGetStock = Uri.parse(
        'https://yfapi.net/v8/finance/spark?interval=1d&range=1mo&symbols=$symbol');

    final response = await http.get(
      uriGetStock,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-api-key': 'uhXL4lyneH5AbmV19LpAI3PLuNHDK21a7hFHaJjo',
      },
    );

    /*Response Decode Data */
    return stockDaysFromJson(response.body);
  }

  /* Create Object */

}
