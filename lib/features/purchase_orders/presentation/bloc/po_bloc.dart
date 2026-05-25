import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/po_repository.dart';
import 'po_event.dart';
import 'po_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  final PurchaseOrderRepository repository;

  PurchaseOrderBloc({required this.repository}) : super(PurchaseOrderInitial()) {
    on<FetchPurchaseOrderEvent>((event, emit) async {
      emit(PurchaseOrderLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(PurchaseOrderError(message: failure.message)),
        (items) => emit(PurchaseOrderLoaded(items: items)),
      );
    });
  }
}
