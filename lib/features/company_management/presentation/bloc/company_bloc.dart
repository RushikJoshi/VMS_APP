import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/company_repository.dart';
import 'company_event.dart';
import 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository repository;

  CompanyBloc({required this.repository}) : super(CompanyInitial()) {
    on<GetCompaniesEvent>((event, emit) async {
      emit(CompanyLoading());
      final result = await repository.getCompanies();
      result.fold(
        (failure) => emit(CompanyError(message: failure.message)),
        (companies) => emit(CompanyLoaded(companies: companies)),
      );
    });
  }
}
