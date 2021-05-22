//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse400 {
  /// Returns a new [InlineResponse400] instance.
  InlineResponse400({
    @required this.status,
  });

  String status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse400 &&
     other.status == status;

  @override
  int get hashCode =>
    (status == null ? 0 : status.hashCode);

  @override
  String toString() => 'InlineResponse400[status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'status'] = status;
    return json;
  }

  /// Returns a new [InlineResponse400] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse400 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse400(
        status: json[r'status'],
    );

  static List<InlineResponse400> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse400>[]
      : json.map((v) => InlineResponse400.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse400> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse400>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse400.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse400-objects as value to a dart map
  static Map<String, List<InlineResponse400>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse400>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse400.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

