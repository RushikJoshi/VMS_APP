import 'package:equatable/equatable.dart';
import '../../domain/entities/grn_entity.dart';

abstract class GrnState extends Equatable {
  const GrnState();
  @override
  List<Object> get props => [];
}
class GrnInitial extends GrnState {}
class GrnLoading extends GrnState {}
class GrnLoaded extends GrnState {
  final List<GrnEntity> items;
  const GrnLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class GrnError extends GrnState {
  final String message;
  const GrnError({required this.message});
  @override
  List<Object> get props => [message];
}
