import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/company_entity.dart';
import '../../domain/repositories/company_repository.dart';
import '../models/company_model.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final Dio dio;

  CompanyRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    try {
      // Simulating API call
      await Future.delayed(const Duration(seconds: 1));
      final dummyData = [
        {'id': '1', 'name': 'TechCorp Global', 'plan': 'Enterprise', 'usersCount': 150, 'revenue': '\,000/mo', 'status': 'Active'},
        {'id': '2', 'name': 'Innovate Inc', 'plan': 'Pro', 'usersCount': 45, 'revenue': '\,000/mo', 'status': 'Active'},
        {'id': '3', 'name': 'NextGen Startups', 'plan': 'Basic', 'usersCount': 10, 'revenue': '\/mo', 'status': 'Suspended'},
      ];
      final List<CompanyEntity> companies = dummyData.map((json) => CompanyModel.fromJson(json)).toList();
      return Right(companies);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to fetch companies'));
    }
  }
}
