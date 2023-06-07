class ProfileModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String nationalCode;
  final String gender;
  final int age;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.nationalCode,
    required this.gender,
    required this.age,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_number'],
        nationalCode: json['national_code'],
        gender: json['gender'],
        age: int.tryParse(json['age'].toString()) ?? 0,
      );
}
