import 'package:my_network_practice/users/data/models/address.dart';
import 'package:my_network_practice/users/data/models/bank.dart';
import 'package:my_network_practice/users/data/models/company.dart';
import 'package:my_network_practice/users/data/models/hair.dart';

enum Gender {
  male,
  female,
  other,
}

enum BloodGroup {
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  oPositive,
  oNegative,
}

class User {
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final BloodGroup? bloodGroup;
  final String? height;
  final String? weight;
  final String? eyeColor;
  final Hair? hair;
  final Address? address;
  final Bank? bank;
  final Company? company;

  const User({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.address,
    required this.bank,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> userData) {

    Gender parseGender(String? genderString) {
      switch(genderString) {
        case 'male':
          return Gender.male;
        case 'female':
          return Gender.female;
        default:
          return Gender.other;
      }
    }

    BloodGroup parseBloodGroup(String? bloodGroupString) {
      switch(bloodGroupString) {
        case 'A+':
          return BloodGroup.aPositive;
        case 'A-':
          return BloodGroup.aNegative;
        case 'B+':
          return BloodGroup.bPositive;
        case 'B-':
          return BloodGroup.bNegative;
        case 'AB+':
          return BloodGroup.abPositive;
        case 'AB-':
          return BloodGroup.abNegative;
        case 'O+':
          return BloodGroup.oPositive;
        default:
          return BloodGroup.oNegative;
      }
    }

    return User(
      firstName: userData['firstName'] ?? 'Unknown',
      lastName: userData['lastName'] ?? 'Unknown',
      gender: parseGender(userData['gender']),
      email: userData['email'] ?? 'Unknown',
      phone: userData['phone'] ?? 'Unknown',
      username: userData['username'] ?? 'Unknown',
      password: userData['password'] ?? 'Unknown',
      birthDate: userData['birthDate'] ?? 'Unknown',
      image: userData['image'] ?? 'Unknown',
      bloodGroup: parseBloodGroup(userData['bloodGroup']),
      height: userData['height'] ?? 'Unknown',
      weight: userData['weight'] ?? 'Unknown',
      eyeColor: userData['eyeColor'] ?? 'Unknown',
      hair: Hair.fromJson(userData['hair']),
      address: Address.fromJson(userData['address']),
      bank: Bank.fromJson(userData['bank']),
      company: Company.fromJson(userData['company']),
    );
  }
}
