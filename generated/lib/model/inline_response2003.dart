//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2003 {
  /// Returns a new [InlineResponse2003] instance.
  InlineResponse2003({
    this.strategies = const [],
  });

  List<InlineResponse2003Strategies> strategies;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2003 &&
     other.strategies == strategies;

  @override
  int get hashCode =>
    (strategies == null ? 0 : strategies.hashCode);

  @override
  String toString() => 'InlineResponse2003[strategies=$strategies]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'strategies'] = strategies;
    return json;
  }

  /// Returns a new [InlineResponse2003] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2003 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2003(
        strategies: InlineResponse2003Strategies.listFromJson(json[r'strategies']),
    );

  static List<InlineResponse2003> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2003>[]
      : json.map((v) => InlineResponse2003.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2003> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2003>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2003.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2003-objects as value to a dart map
  static Map<String, List<InlineResponse2003>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2003>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2003.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

