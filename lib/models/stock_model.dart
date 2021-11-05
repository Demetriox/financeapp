// To parse this JSON data, do
//
//     final stockDays = stockDaysFromJson(jsonString);

import 'dart:convert';

Map<String, StockDays> stockDaysFromJson(String str) =>
    Map.from(json.decode(str))
        .map((k, v) => MapEntry<String, StockDays>(k, StockDays.fromJson(v)));

String stockDaysToJson(Map<String, StockDays> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class StockDays {
  StockDays({
    this.symbol,
    this.timestamp,
    this.previousClose,
    this.chartPreviousClose,
    this.close,
    this.end,
    this.start,
    this.dataGranularity,
  });

  String? symbol;
  List<int>? timestamp;
  dynamic previousClose;
  double? chartPreviousClose;
  List<double>? close;
  dynamic end;
  dynamic start;
  int? dataGranularity;

  factory StockDays.fromJson(Map<String, dynamic> json) => StockDays(
        symbol: json["symbol"] == null ? null : json["symbol"],
        timestamp: json["timestamp"] == null
            ? null
            : List<int>.from(json["timestamp"].map((x) => x)),
        previousClose: json["previousClose"],
        chartPreviousClose: json["chartPreviousClose"] == null
            ? null
            : json["chartPreviousClose"].toDouble(),
        close: json["close"] == null
            ? null
            : List<double>.from(json["close"].map((x) => x.toDouble())),
        end: json["end"],
        start: json["start"],
        dataGranularity:
            json["dataGranularity"] == null ? null : json["dataGranularity"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol == null ? null : symbol,
        "timestamp": timestamp == null
            ? null
            : List<dynamic>.from(timestamp!.map((x) => x)),
        "previousClose": previousClose,
        "chartPreviousClose":
            chartPreviousClose == null ? null : chartPreviousClose,
        "close":
            close == null ? null : List<dynamic>.from(close!.map((x) => x)),
        "end": end,
        "start": start,
        "dataGranularity": dataGranularity == null ? null : dataGranularity,
      };
}
