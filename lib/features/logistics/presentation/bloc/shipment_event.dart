import 'package:equatable/equatable.dart';

abstract class ShipmentEvent extends Equatable {
  const ShipmentEvent();
  @override
  List<Object> get props => [];
}
class FetchShipmentEvent extends ShipmentEvent {}
