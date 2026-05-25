import 'package:equatable/equatable.dart';

class ShipmentEntity extends Equatable {
  final String id;
  final String name;

  const ShipmentEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
