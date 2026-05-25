import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/so_entity.dart';

abstract class SalesOrderRepository {
  Future<Either<Failure, List<SalesOrderEntity>>> getItems();
}
