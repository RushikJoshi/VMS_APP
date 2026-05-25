import 'package:equatable/equatable.dart';

class RfqEntity extends Equatable {
  final String id;
  final String name;

  const RfqEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
