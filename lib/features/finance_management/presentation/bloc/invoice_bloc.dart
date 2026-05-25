import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/invoice_repository.dart';
import 'invoice_event.dart';
import 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final InvoiceRepository repository;

  InvoiceBloc({required this.repository}) : super(InvoiceInitial()) {
    on<FetchInvoiceEvent>((event, emit) async {
      emit(InvoiceLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(InvoiceError(message: failure.message)),
        (items) => emit(InvoiceLoaded(items: items)),
      );
    });
  }
}
