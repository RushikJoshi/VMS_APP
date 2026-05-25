import 'package:equatable/equatable.dart';

abstract class PurchaseOrderEvent extends Equatable {
  const PurchaseOrderEvent();
  @override
  List<Object> get props => [];
}
class FetchPurchaseOrderEvent extends PurchaseOrderEvent {}
