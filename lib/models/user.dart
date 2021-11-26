class User {
  int? id;
  String name;
  String? email;
  String? phone;

  User({this.email, required this.name, required this.id, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'] ?? 'No email',
        name: json['name'],
        id: json['id'],
        phone: json['phone'] ?? 'No phone');
  }
}
