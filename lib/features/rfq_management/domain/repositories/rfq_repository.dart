import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/rfq_entity.dart';

abstract class RfqRepository {
  Future<Either<Failure, List<RfqEntity>>> getItems();
}
