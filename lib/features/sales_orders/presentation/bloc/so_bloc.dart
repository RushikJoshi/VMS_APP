import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/so_repository.dart';
import 'so_event.dart';
import 'so_state.dart';

class SalesOrderBloc extends Bloc<SalesOrderEvent, SalesOrderState> {
  final SalesOrderRepository repository;

  SalesOrderBloc({required this.repository}) : super(SalesOrderInitial()) {
    on<FetchSalesOrderEvent>((event, emit) async {
      emit(SalesOrderLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(SalesOrderError(message: failure.message)),
        (items) => emit(SalesOrderLoaded(items: items)),
      );
    });
  }
}
