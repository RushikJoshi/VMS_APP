import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/shipment_entity.dart';

abstract class ShipmentRepository {
  Future<Either<Failure, List<ShipmentEntity>>> getItems();
}
