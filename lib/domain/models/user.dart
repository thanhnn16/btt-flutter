class User {
  final String id;
  final String fullName;
  final String phoneNumber;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
  });

  static User empty = User(id: '', fullName: '', phoneNumber: '');
}
