import 'package:equatable/equatable.dart';
import '../../domain/entities/metric_entity.dart';

abstract class MetricState extends Equatable {
  const MetricState();
  @override
  List<Object> get props => [];
}
class MetricInitial extends MetricState {}
class MetricLoading extends MetricState {}
class MetricLoaded extends MetricState {
  final List<MetricEntity> items;
  const MetricLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class MetricError extends MetricState {
  final String message;
  const MetricError({required this.message});
  @override
  List<Object> get props => [message];
}
