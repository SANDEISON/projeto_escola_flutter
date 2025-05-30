enum UserRole { coordinator, teacher, student, admin }

class User {
  final String username;
  final String password;
  final UserRole role;

  User({required this.username, required this.password, required this.role});
}
