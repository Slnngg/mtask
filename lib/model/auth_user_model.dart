class AuthUserModel {
  final String phone;
  final String password;
  final String email;
  final String address;
  final String city;
  final String postCode;
  final String fullName;
  final String userName;
  final DateTime? dateOfBirth;
  final String selectedCountry;

  AuthUserModel({
    required this.phone,
    required this.password,
    required this.email,
    required this.address,
    required this.city,
    required this.postCode,
    required this.fullName,
    required this.userName,
    this.dateOfBirth,
    required this.selectedCountry,
  });

  Map<String, dynamic> toMap() => {
        'phone': phone,
        'password': password,
        'email': email,
        'address': address,
        'city': city,
        'postCode': postCode,
        'fullName': fullName,
        'userName': userName,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'selectedCountry': selectedCountry,
      };

  factory AuthUserModel.fromMap(Map<String, dynamic> map) => AuthUserModel(
        phone: map['phone'],
        password: map['password'],
        email: map['email'],
        address: map['address'],
        city: map['city'],
        postCode: map['postCode'],
        fullName: map['fullName'],
        userName: map['userName'],
        dateOfBirth: map['dateOfBirth'] != null
            ? DateTime.parse(map['dateOfBirth'])
            : null,
        selectedCountry: map['selectedCountry'],
      );
}
