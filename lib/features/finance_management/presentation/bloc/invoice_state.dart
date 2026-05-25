import 'package:equatable/equatable.dart';
import '../../domain/entities/invoice_entity.dart';

abstract class InvoiceState extends Equatable {
  const InvoiceState();
  @override
  List<Object> get props => [];
}
class InvoiceInitial extends InvoiceState {}
class InvoiceLoading extends InvoiceState {}
class InvoiceLoaded extends InvoiceState {
  final List<InvoiceEntity> items;
  const InvoiceLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class InvoiceError extends InvoiceState {
  final String message;
  const InvoiceError({required this.message});
  @override
  List<Object> get props => [message];
}
