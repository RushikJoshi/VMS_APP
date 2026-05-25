import 'package:equatable/equatable.dart';

class PurchaseOrderEntity extends Equatable {
  final String id;
  final String name;

  const PurchaseOrderEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
