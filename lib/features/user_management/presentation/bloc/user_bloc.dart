import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      final result = await repository.getItems();
      result.fold(
        (failure) => emit(UserError(message: failure.message)),
        (items) => emit(UserLoaded(items: items)),
      );
    });
  }
}
