import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}
class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final List<UserEntity> items;
  const UserLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class UserError extends UserState {
  final String message;
  const UserError({required this.message});
  @override
  List<Object> get props => [message];
}
