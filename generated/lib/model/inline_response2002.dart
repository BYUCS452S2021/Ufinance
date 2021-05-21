//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2002 {
  /// Returns a new [InlineResponse2002] instance.
  InlineResponse2002({
    @required this.time,
  });

  DateTime time;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2002 &&
     other.time == time;

  @override
  int get hashCode =>
    (time == null ? 0 : time.hashCode);

  @override
  String toString() => 'InlineResponse2002[time=$time]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'time'] = time.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [InlineResponse2002] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2002 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2002(
        time: json[r'time'] == null
          ? null
          : DateTime.parse(json[r'time']),
    );

  static List<InlineResponse2002> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2002>[]
      : json.map((v) => InlineResponse2002.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2002> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2002>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2002.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2002-objects as value to a dart map
  static Map<String, List<InlineResponse2002>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2002>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2002.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

