//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2006 {
  /// Returns a new [InlineResponse2006] instance.
  InlineResponse2006({
    this.holdings = const [],
  });

  List<InlineResponse2006Holdings> holdings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2006 &&
     other.holdings == holdings;

  @override
  int get hashCode =>
    (holdings == null ? 0 : holdings.hashCode);

  @override
  String toString() => 'InlineResponse2006[holdings=$holdings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'holdings'] = holdings;
    return json;
  }

  /// Returns a new [InlineResponse2006] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2006 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2006(
        holdings: InlineResponse2006Holdings.listFromJson(json[r'holdings']),
    );

  static List<InlineResponse2006> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2006>[]
      : json.map((v) => InlineResponse2006.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2006> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2006>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2006.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2006-objects as value to a dart map
  static Map<String, List<InlineResponse2006>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2006>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2006.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

