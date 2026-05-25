import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/subscription_entity.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, List<SubscriptionEntity>>> getItems();
}
