class User {
  final int userId;
  final String emailAddress;
  final String firstName;
  final String middleName;
  final String lastName;
  final int investmentStrategy;
  String token;

  User(
    this.userId,
    this.emailAddress,
    this.firstName,
    this.middleName,
    this.lastName,
    this.investmentStrategy,
    this.token,
  );
}
