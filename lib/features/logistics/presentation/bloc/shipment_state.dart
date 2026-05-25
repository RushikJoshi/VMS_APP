import 'package:equatable/equatable.dart';
import '../../domain/entities/shipment_entity.dart';

abstract class ShipmentState extends Equatable {
  const ShipmentState();
  @override
  List<Object> get props => [];
}
class ShipmentInitial extends ShipmentState {}
class ShipmentLoading extends ShipmentState {}
class ShipmentLoaded extends ShipmentState {
  final List<ShipmentEntity> items;
  const ShipmentLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class ShipmentError extends ShipmentState {
  final String message;
  const ShipmentError({required this.message});
  @override
  List<Object> get props => [message];
}
