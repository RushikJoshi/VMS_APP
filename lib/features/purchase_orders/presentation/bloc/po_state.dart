import 'package:equatable/equatable.dart';
import '../../domain/entities/po_entity.dart';

abstract class PurchaseOrderState extends Equatable {
  const PurchaseOrderState();
  @override
  List<Object> get props => [];
}
class PurchaseOrderInitial extends PurchaseOrderState {}
class PurchaseOrderLoading extends PurchaseOrderState {}
class PurchaseOrderLoaded extends PurchaseOrderState {
  final List<PurchaseOrderEntity> items;
  const PurchaseOrderLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class PurchaseOrderError extends PurchaseOrderState {
  final String message;
  const PurchaseOrderError({required this.message});
  @override
  List<Object> get props => [message];
}
