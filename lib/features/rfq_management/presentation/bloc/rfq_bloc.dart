import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/rfq_repository.dart';
import 'rfq_event.dart';
import 'rfq_state.dart';

class RfqBloc extends Bloc<RfqEvent, RfqState> {
  final RfqRepository repository;

  RfqBloc({required this.repository}) : super(RfqInitial()) {
    on<FetchRfqEvent>((event, emit) async {
      emit(RfqLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(RfqError(message: failure.message)),
        (items) => emit(RfqLoaded(items: items)),
      );
    });
  }
}
