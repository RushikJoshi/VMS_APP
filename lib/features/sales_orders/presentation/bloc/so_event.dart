import 'package:equatable/equatable.dart';

abstract class SalesOrderEvent extends Equatable {
  const SalesOrderEvent();
  @override
  List<Object> get props => [];
}
class FetchSalesOrderEvent extends SalesOrderEvent {}
