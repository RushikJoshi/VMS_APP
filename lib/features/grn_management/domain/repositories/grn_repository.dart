import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/grn_entity.dart';

abstract class GrnRepository {
  Future<Either<Failure, List<GrnEntity>>> getItems();
}
