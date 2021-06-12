//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2005 {
  /// Returns a new [InlineResponse2005] instance.
  InlineResponse2005({
    @required this.userId,
    @required this.emailAddress,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.investmentStrategy,
  });

  // minimum: 0
  int userId;

  String emailAddress;

  String firstName;

  String middleName;

  String lastName;

  // minimum: 0
  int investmentStrategy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2005 &&
     other.userId == userId &&
     other.emailAddress == emailAddress &&
     other.firstName == firstName &&
     other.middleName == middleName &&
     other.lastName == lastName &&
     other.investmentStrategy == investmentStrategy;

  @override
  int get hashCode =>
    (userId == null ? 0 : userId.hashCode) +
    (emailAddress == null ? 0 : emailAddress.hashCode) +
    (firstName == null ? 0 : firstName.hashCode) +
    (middleName == null ? 0 : middleName.hashCode) +
    (lastName == null ? 0 : lastName.hashCode) +
    (investmentStrategy == null ? 0 : investmentStrategy.hashCode);

  @override
  String toString() => 'InlineResponse2005[userId=$userId, emailAddress=$emailAddress, firstName=$firstName, middleName=$middleName, lastName=$lastName, investmentStrategy=$investmentStrategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'user_id'] = userId;
      json[r'email_address'] = emailAddress;
      json[r'first_name'] = firstName;
      json[r'middle_name'] = middleName;
      json[r'last_name'] = lastName;
      json[r'investment_strategy'] = investmentStrategy;
    return json;
  }

  /// Returns a new [InlineResponse2005] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2005 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2005(
        userId: json[r'user_id'],
        emailAddress: json[r'email_address'],
        firstName: json[r'first_name'],
        middleName: json[r'middle_name'],
        lastName: json[r'last_name'],
        investmentStrategy: json[r'investment_strategy'],
    );

  static List<InlineResponse2005> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2005>[]
      : json.map((v) => InlineResponse2005.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2005> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2005>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2005.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2005-objects as value to a dart map
  static Map<String, List<InlineResponse2005>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2005>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2005.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

