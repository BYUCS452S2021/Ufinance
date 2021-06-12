//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse2001 {
  /// Returns a new [InlineResponse2001] instance.
  InlineResponse2001({
    @required this.userId,
    @required this.emailAddress,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.investmentStrategy,
    @required this.token,
  });

  // minimum: 0
  int userId;

  String emailAddress;

  String firstName;

  String middleName;

  String lastName;

  // minimum: 0
  int investmentStrategy;

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse2001 &&
     other.userId == userId &&
     other.emailAddress == emailAddress &&
     other.firstName == firstName &&
     other.middleName == middleName &&
     other.lastName == lastName &&
     other.investmentStrategy == investmentStrategy &&
     other.token == token;

  @override
  int get hashCode =>
    (userId == null ? 0 : userId.hashCode) +
    (emailAddress == null ? 0 : emailAddress.hashCode) +
    (firstName == null ? 0 : firstName.hashCode) +
    (middleName == null ? 0 : middleName.hashCode) +
    (lastName == null ? 0 : lastName.hashCode) +
    (investmentStrategy == null ? 0 : investmentStrategy.hashCode) +
    (token == null ? 0 : token.hashCode);

  @override
  String toString() => 'InlineResponse2001[userId=$userId, emailAddress=$emailAddress, firstName=$firstName, middleName=$middleName, lastName=$lastName, investmentStrategy=$investmentStrategy, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'user_id'] = userId;
      json[r'email_address'] = emailAddress;
      json[r'first_name'] = firstName;
      json[r'middle_name'] = middleName;
      json[r'last_name'] = lastName;
      json[r'investment_strategy'] = investmentStrategy;
      json[r'token'] = token;
    return json;
  }

  /// Returns a new [InlineResponse2001] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineResponse2001 fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineResponse2001(
        userId: json[r'user_id'],
        emailAddress: json[r'email_address'],
        firstName: json[r'first_name'],
        middleName: json[r'middle_name'],
        lastName: json[r'last_name'],
        investmentStrategy: json[r'investment_strategy'],
        token: json[r'token'],
    );

  static List<InlineResponse2001> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineResponse2001>[]
      : json.map((v) => InlineResponse2001.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineResponse2001> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineResponse2001>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineResponse2001.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse2001-objects as value to a dart map
  static Map<String, List<InlineResponse2001>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineResponse2001>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineResponse2001.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

