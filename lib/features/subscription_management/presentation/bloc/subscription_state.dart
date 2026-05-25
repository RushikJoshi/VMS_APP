import 'package:equatable/equatable.dart';
import '../../domain/entities/subscription_entity.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
  @override
  List<Object> get props => [];
}
class SubscriptionInitial extends SubscriptionState {}
class SubscriptionLoading extends SubscriptionState {}
class SubscriptionLoaded extends SubscriptionState {
  final List<SubscriptionEntity> items;
  const SubscriptionLoaded({required this.items});
  @override
  List<Object> get props => [items];
}
class SubscriptionError extends SubscriptionState {
  final String message;
  const SubscriptionError({required this.message});
  @override
  List<Object> get props => [message];
}
