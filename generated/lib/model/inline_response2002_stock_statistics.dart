//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2002StockStatistics {
  /// Returns a new [InlineResponse2002StockStatistics] instance.
  InlineResponse2002StockStatistics({
    @required this.stockTicker,
    @required this.currentPrice,
    @required this.maxPrice,
    @required this.minPrice,
    @required this.standardDeviation,
  });

  String stockTicker;

  String currentPrice;

  String maxPrice;

  String minPrice;

  num standardDeviation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2002StockStatistics &&
     other.stockTicker == stockTicker &&
     other.currentPrice == currentPrice &&
     other.maxPrice == maxPrice &&
     other.minPrice == minPrice &&
     other.standardDeviation == standardDeviation;

  @override
  int get hashCode =>
    (stockTicker == null ? 0 : stockTicker.hashCode) +
    (currentPrice == null ? 0 : currentPrice.hashCode) +
    (maxPrice == null ? 0 : maxPrice.hashCode) +
    (minPrice == null ? 0 : minPrice.hashCode) +
    (standardDeviation == null ? 0 : standardDeviation.hashCode);

  @override
  String toString() => 'InlineResponse2002StockStatistics[stockTicker=$stockTicker, currentPrice=$currentPrice, maxPrice=$maxPrice, minPrice=$minPrice, standardDeviation=$standardDeviation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'stock_ticker'] = stockTicker;
      json[r'current_price'] = currentPrice;
      json[r'max_price'] = maxPrice;
      json[r'min_price'] = minPrice;
      json[r'standard_deviation'] = standardDeviation;
    return json;
  }

  /// Returns a new [InlineResponse2002StockStatistics] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2002StockStatistics fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2002StockStatistics(
        stockTicker: json[r'stock_ticker'],
        currentPrice: json[r'current_price'],
        maxPrice: json[r'max_price'],
        minPrice: json[r'min_price'],
        standardDeviation: json[r'standard_deviation'] == null ?
          null :
          json[r'standard_deviation'].toDouble(),
    );

  static List<InlineResponse2002StockStatistics> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2002StockStatistics>[]
      : json.map((v) => InlineResponse2002StockStatistics.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2002StockStatistics> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2002StockStatistics>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2002StockStatistics.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2002StockStatistics-objects as value to a dart map
  static Map<String, List<InlineResponse2002StockStatistics>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2002StockStatistics>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2002StockStatistics.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

