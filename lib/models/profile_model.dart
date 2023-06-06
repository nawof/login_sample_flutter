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

// abstract class Empolyee {
//   void work();
//   factory Empolyee(String type) {
//     switch (type) {
//       case 'programmer':
//         return Programmer();
//       case 'hr':
//         return HRManager();
//       case 'boss':
//         return Boss();
//       default:
//         Programmer();
//     }
//   }
// }

// enum EmployeeType {
//   programmer,
//   boss,
//   hr,
// }

// class Programmer implements Empolyee {
//   @override
//   void work() {
//     print('codeing an app');
//   }
// }

// class HRManager implements Empolyee {
//   @override
//   void work() {
//     print('recruiting people');
//   }
// }

// class Boss implements Empolyee {
//   @override
//   void work() {
//     print('leading the people');
//   }
// }

// class FactoryMethod {
//   static Empolyee getEmployee(EmployeeType type) {
//     switch (type) {
//       case EmployeeType.programmer:
//         return Programmer();
//       case EmployeeType.hr:
//         return HRManager();
//       case EmployeeType.boss:
//         return Boss();
//       default:
//         return Programmer();
//     }
//   }
// }
