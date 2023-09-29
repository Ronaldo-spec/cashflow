class User {
  int id;
  String Username;
  String Password;

  User({
    required this.id,
    required this.Username,
    required this.Password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      Username: map['Username'],
      Password: map['Password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Username': Username,
      'Password': Password,
    };
  }
}