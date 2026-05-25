import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/metric_entity.dart';

abstract class MetricRepository {
  Future<Either<Failure, List<MetricEntity>>> getItems();
}
