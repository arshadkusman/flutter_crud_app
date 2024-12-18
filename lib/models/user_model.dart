class User {
  final String id;
  final String name;
  final String email;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'], 
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
    };
  }
}
