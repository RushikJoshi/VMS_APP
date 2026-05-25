import 'package:equatable/equatable.dart';

class GrnEntity extends Equatable {
  final String id;
  final String name;

  const GrnEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
