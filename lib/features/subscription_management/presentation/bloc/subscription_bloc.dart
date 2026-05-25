import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/subscription_repository.dart';
import 'subscription_event.dart';
import 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final SubscriptionRepository repository;

  SubscriptionBloc({required this.repository}) : super(SubscriptionInitial()) {
    on<FetchSubscriptionEvent>((event, emit) async {
      emit(SubscriptionLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(SubscriptionError(message: failure.message)),
        (items) => emit(SubscriptionLoaded(items: items)),
      );
    });
  }
}
