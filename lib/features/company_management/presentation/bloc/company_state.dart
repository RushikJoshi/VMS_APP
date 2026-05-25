import 'package:equatable/equatable.dart';
import '../../domain/entities/company_entity.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();
  
  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<CompanyEntity> companies;
  const CompanyLoaded({required this.companies});

  @override
  List<Object> get props => [companies];
}

class CompanyError extends CompanyState {
  final String message;
  const CompanyError({required this.message});

  @override
  List<Object> get props => [message];
}
