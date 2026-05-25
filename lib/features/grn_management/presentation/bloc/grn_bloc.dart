import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/grn_repository.dart';
import 'grn_event.dart';
import 'grn_state.dart';

class GrnBloc extends Bloc<GrnEvent, GrnState> {
  final GrnRepository repository;

  GrnBloc({required this.repository}) : super(GrnInitial()) {
    on<FetchGrnEvent>((event, emit) async {
      emit(GrnLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(GrnError(message: failure.message)),
        (items) => emit(GrnLoaded(items: items)),
      );
    });
  }
}
