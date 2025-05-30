class User {
  final int? id;
  final String email;
  final String name;
  final String surname;
  final String phone;
  final String employee;
  final String birthDate;
  final String? imagePath;

  User({
    this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.phone,
    required this.employee,
    required this.birthDate,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'phone': phone,
      'employee': employee,
      'birthDate': birthDate,
      'imagePath': imagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      surname: map['surname'],
      phone: map['phone'],
      employee: map['employee'],
      birthDate: map['birthDate'],
      imagePath: map['imagePath'],
    );
  }
}