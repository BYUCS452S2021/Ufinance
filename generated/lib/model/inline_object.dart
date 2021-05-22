//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject {
  /// Returns a new [InlineObject] instance.
  InlineObject({
    @required this.emailAddress,
    @required this.password,
    @required this.firstName,
    this.middleName,
    @required this.lastName,
    @required this.investmentStrategy,
  });

  String emailAddress;

  String password;

  String firstName;

  String middleName;

  String lastName;

  // minimum: 0
  int investmentStrategy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject &&
     other.emailAddress == emailAddress &&
     other.password == password &&
     other.firstName == firstName &&
     other.middleName == middleName &&
     other.lastName == lastName &&
     other.investmentStrategy == investmentStrategy;

  @override
  int get hashCode =>
    (emailAddress == null ? 0 : emailAddress.hashCode) +
    (password == null ? 0 : password.hashCode) +
    (firstName == null ? 0 : firstName.hashCode) +
    (middleName == null ? 0 : middleName.hashCode) +
    (lastName == null ? 0 : lastName.hashCode) +
    (investmentStrategy == null ? 0 : investmentStrategy.hashCode);

  @override
  String toString() => 'InlineObject[emailAddress=$emailAddress, password=$password, firstName=$firstName, middleName=$middleName, lastName=$lastName, investmentStrategy=$investmentStrategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email_address'] = emailAddress;
      json[r'password'] = password;
      json[r'first_name'] = firstName;
    if (middleName != null) {
      json[r'middle_name'] = middleName;
    }
      json[r'last_name'] = lastName;
      json[r'investment_strategy'] = investmentStrategy;
    return json;
  }

  /// Returns a new [InlineObject] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static InlineObject fromJson(Map<String, dynamic> json) => json == null
    ? null
    : InlineObject(
        emailAddress: json[r'email_address'],
        password: json[r'password'],
        firstName: json[r'first_name'],
        middleName: json[r'middle_name'],
        lastName: json[r'last_name'],
        investmentStrategy: json[r'investment_strategy'],
    );

  static List<InlineObject> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <InlineObject>[]
      : json.map((v) => InlineObject.fromJson(v)).toList(growable: true == growable);

  static Map<String, InlineObject> mapFromJson(Map<String, dynamic> json) {
    final map = <String, InlineObject>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = InlineObject.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of InlineObject-objects as value to a dart map
  static Map<String, List<InlineObject>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<InlineObject>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = InlineObject.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

