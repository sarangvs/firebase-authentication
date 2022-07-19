class UserModel {
  String? uid;
  String? name;
  String? phone;
  String? email;
  DateTime? createdAt;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.phone,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        phone: map['phone'],
        createdAt: DateTime.tryParse('createdAt'),
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'name': name,
        'phone': phone,
        'createdAt': createdAt,
      };
}
