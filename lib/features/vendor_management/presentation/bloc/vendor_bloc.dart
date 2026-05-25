import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/vendor_repository.dart';
import 'vendor_event.dart';
import 'vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  final VendorRepository repository;

  VendorBloc({required this.repository}) : super(VendorInitial()) {
    on<FetchVendorEvent>((event, emit) async {
      emit(VendorLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(VendorError(message: failure.message)),
        (items) => emit(VendorLoaded(items: items)),
      );
    });
  }
}
