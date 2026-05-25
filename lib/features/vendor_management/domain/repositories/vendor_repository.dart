import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/vendor_entity.dart';

abstract class VendorRepository {
  Future<Either<Failure, List<VendorEntity>>> getItems();
}
