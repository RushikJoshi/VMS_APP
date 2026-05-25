import 'package:equatable/equatable.dart';
import '../../domain/entities/so_entity.dart';

abstract class SalesOrderState extends Equatable {
  const SalesOrderState();
  @override
  List<Object> get props => [];
}
class SalesOrderInitial extends SalesOrderState {}
class SalesOrderLoading extends SalesOrderState {}
class SalesOrderLoaded extends SalesOrderState {
  final List<SalesOrderEntity> items;
  const SalesOrderLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class SalesOrderError extends SalesOrderState {
  final String message;
  const SalesOrderError({required this.message});
  @override
  List<Object> get props => [message];
}
