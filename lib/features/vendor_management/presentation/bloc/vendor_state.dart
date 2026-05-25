import 'package:equatable/equatable.dart';
import '../../domain/entities/vendor_entity.dart';

abstract class VendorState extends Equatable {
  const VendorState();
  @override
  List<Object> get props => [];
}
class VendorInitial extends VendorState {}
class VendorLoading extends VendorState {}
class VendorLoaded extends VendorState {
  final List<VendorEntity> items;
  const VendorLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class VendorError extends VendorState {
  final String message;
  const VendorError({required this.message});
  @override
  List<Object> get props => [message];
}
