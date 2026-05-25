import 'package:equatable/equatable.dart';

class MetricEntity extends Equatable {
  final String id;
  final String name;

  const MetricEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
