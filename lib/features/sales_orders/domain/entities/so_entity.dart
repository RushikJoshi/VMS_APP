import 'package:equatable/equatable.dart';

class SalesOrderEntity extends Equatable {
  final String id;
  final String name;

  const SalesOrderEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
