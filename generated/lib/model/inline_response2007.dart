//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2007 {
  /// Returns a new [InlineResponse2007] instance.
  InlineResponse2007({
    @required this.totalValue,
  });

  String totalValue;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2007 &&
     other.totalValue == totalValue;

  @override
  int get hashCode =>
    (totalValue == null ? 0 : totalValue.hashCode);

  @override
  String toString() => 'InlineResponse2007[totalValue=$totalValue]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'total_value'] = totalValue;
    return json;
  }

  /// Returns a new [InlineResponse2007] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2007 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2007(
        totalValue: json[r'total_value'],
    );

  static List<InlineResponse2007> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2007>[]
      : json.map((v) => InlineResponse2007.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2007> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2007>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2007.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2007-objects as value to a dart map
  static Map<String, List<InlineResponse2007>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2007>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2007.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

