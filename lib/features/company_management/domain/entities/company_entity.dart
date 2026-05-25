import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final String id;
  final String name;
  final String plan;
  final int usersCount;
  final String revenue;
  final String status;

  const CompanyEntity({
    required this.id,
    required this.name,
    required this.plan,
    required this.usersCount,
    required this.revenue,
    required this.status,
  });

  @override
  List<Object?> get props => [id, name, plan, usersCount, revenue, status];
}
