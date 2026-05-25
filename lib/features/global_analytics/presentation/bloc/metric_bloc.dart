import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/metric_repository.dart';
import 'metric_event.dart';
import 'metric_state.dart';

class MetricBloc extends Bloc<MetricEvent, MetricState> {
  final MetricRepository repository;

  MetricBloc({required this.repository}) : super(MetricInitial()) {
    on<FetchMetricEvent>((event, emit) async {
      emit(MetricLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(MetricError(message: failure.message)),
        (items) => emit(MetricLoaded(items: items)),
      );
    });
  }
}
