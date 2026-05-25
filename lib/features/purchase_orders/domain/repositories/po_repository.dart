import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/po_entity.dart';

abstract class PurchaseOrderRepository {
  Future<Either<Failure, List<PurchaseOrderEntity>>> getItems();
}
