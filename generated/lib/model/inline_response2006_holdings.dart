//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2006Holdings {
  /// Returns a new [InlineResponse2006Holdings] instance.
  InlineResponse2006Holdings({
    @required this.stockTicker,
    @required this.numberOfShares,
  });

  String stockTicker;

  // minimum: 0
  num numberOfShares;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2006Holdings &&
     other.stockTicker == stockTicker &&
     other.numberOfShares == numberOfShares;

  @override
  int get hashCode =>
    (stockTicker == null ? 0 : stockTicker.hashCode) +
    (numberOfShares == null ? 0 : numberOfShares.hashCode);

  @override
  String toString() => 'InlineResponse2006Holdings[stockTicker=$stockTicker, numberOfShares=$numberOfShares]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'stock_ticker'] = stockTicker;
      json[r'number_of_shares'] = numberOfShares;
    return json;
  }

  /// Returns a new [InlineResponse2006Holdings] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2006Holdings fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2006Holdings(
        stockTicker: json[r'stock_ticker'],
        numberOfShares: json[r'number_of_shares'] == null ?
          null :
          json[r'number_of_shares'].toDouble(),
    );

  static List<InlineResponse2006Holdings> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2006Holdings>[]
      : json.map((v) => InlineResponse2006Holdings.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2006Holdings> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2006Holdings>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2006Holdings.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2006Holdings-objects as value to a dart map
  static Map<String, List<InlineResponse2006Holdings>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2006Holdings>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2006Holdings.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

