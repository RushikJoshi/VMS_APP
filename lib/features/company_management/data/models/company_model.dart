import '../../domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required String id,
    required String name,
    required String plan,
    required int usersCount,
    required String revenue,
    required String status,
  }) : super(
          id: id,
          name: name,
          plan: plan,
          usersCount: usersCount,
          revenue: revenue,
          status: status,
        );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      plan: json['plan'] ?? 'Basic',
      usersCount: json['usersCount'] ?? 0,
      revenue: json['revenue'] ?? '\$0',
      status: json['status'] ?? 'Active',
    );
  }
}
