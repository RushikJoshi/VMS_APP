import 'package:equatable/equatable.dart';

class VendorEntity extends Equatable {
  final String id;
  final String name;

  const VendorEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
