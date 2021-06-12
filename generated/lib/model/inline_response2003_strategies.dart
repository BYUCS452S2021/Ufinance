//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2003Strategies {
  /// Returns a new [InlineResponse2003Strategies] instance.
  InlineResponse2003Strategies({
    @required this.investmentStrategyId,
    @required this.investmentStrategyName,
    @required this.riskLowerBound,
    @required this.riskUpperBound,
    @required this.strategyDescription,
  });

  // minimum: 0
  int investmentStrategyId;

  String investmentStrategyName;

  // minimum: 0
  num riskLowerBound;

  // minimum: 0
  num riskUpperBound;

  String strategyDescription;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2003Strategies &&
     other.investmentStrategyId == investmentStrategyId &&
     other.investmentStrategyName == investmentStrategyName &&
     other.riskLowerBound == riskLowerBound &&
     other.riskUpperBound == riskUpperBound &&
     other.strategyDescription == strategyDescription;

  @override
  int get hashCode =>
    (investmentStrategyId == null ? 0 : investmentStrategyId.hashCode) +
    (investmentStrategyName == null ? 0 : investmentStrategyName.hashCode) +
    (riskLowerBound == null ? 0 : riskLowerBound.hashCode) +
    (riskUpperBound == null ? 0 : riskUpperBound.hashCode) +
    (strategyDescription == null ? 0 : strategyDescription.hashCode);

  @override
  String toString() => 'InlineResponse2003Strategies[investmentStrategyId=$investmentStrategyId, investmentStrategyName=$investmentStrategyName, riskLowerBound=$riskLowerBound, riskUpperBound=$riskUpperBound, strategyDescription=$strategyDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'investment_strategy_id'] = investmentStrategyId;
      json[r'investment_strategy_name'] = investmentStrategyName;
      json[r'risk_lower_bound'] = riskLowerBound;
      json[r'risk_upper_bound'] = riskUpperBound;
      json[r'strategy_description'] = strategyDescription;
    return json;
  }

  /// Returns a new [InlineResponse2003Strategies] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2003Strategies fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2003Strategies(
        investmentStrategyId: json[r'investment_strategy_id'],
        investmentStrategyName: json[r'investment_strategy_name'],
        riskLowerBound: json[r'risk_lower_bound'] == null ?
          null :
          json[r'risk_lower_bound'].toDouble(),
        riskUpperBound: json[r'risk_upper_bound'] == null ?
          null :
          json[r'risk_upper_bound'].toDouble(),
        strategyDescription: json[r'strategy_description'],
    );

  static List<InlineResponse2003Strategies> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2003Strategies>[]
      : json.map((v) => InlineResponse2003Strategies.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2003Strategies> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2003Strategies>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2003Strategies.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2003Strategies-objects as value to a dart map
  static Map<String, List<InlineResponse2003Strategies>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2003Strategies>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2003Strategies.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

