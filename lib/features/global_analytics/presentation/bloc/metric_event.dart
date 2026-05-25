import 'package:equatable/equatable.dart';

abstract class MetricEvent extends Equatable {
  const MetricEvent();
  @override
  List<Object> get props => [];
}
class FetchMetricEvent extends MetricEvent {}
