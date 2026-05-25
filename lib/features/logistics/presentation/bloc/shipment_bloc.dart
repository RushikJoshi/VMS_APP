import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/shipment_repository.dart';
import 'shipment_event.dart';
import 'shipment_state.dart';

class ShipmentBloc extends Bloc<ShipmentEvent, ShipmentState> {
  final ShipmentRepository repository;

  ShipmentBloc({required this.repository}) : super(ShipmentInitial()) {
    on<FetchShipmentEvent>((event, emit) async {
      emit(ShipmentLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(ShipmentError(message: failure.message)),
        (items) => emit(ShipmentLoaded(items: items)),
      );
    });
  }
}
