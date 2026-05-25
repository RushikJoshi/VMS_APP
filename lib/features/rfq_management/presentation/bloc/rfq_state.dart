import 'package:equatable/equatable.dart';
import '../../domain/entities/rfq_entity.dart';

abstract class RfqState extends Equatable {
  const RfqState();
  @override
  List<Object> get props => [];
}
class RfqInitial extends RfqState {}
class RfqLoading extends RfqState {}
class RfqLoaded extends RfqState {
  final List<RfqEntity> items;
  const RfqLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class RfqError extends RfqState {
  final String message;
  const RfqError({required this.message});
  @override
  List<Object> get props => [message];
}
