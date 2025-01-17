import 'package:my_network_practice/users/data/models/address.dart';

class Company {
  final String? department;
  final String? name;
  final String? title;
  final Address address;

  const Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  factory Company.fromJson(Map<String, dynamic> companyData) {
    return Company(
      department: companyData['department'] ?? 'Unknown',
      name: companyData['name'] ?? 'Unknown',
      title: companyData['title'] ?? 'Unknown',
      address: Address.fromJson(companyData['address']),
    );
  }
}
