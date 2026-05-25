import 'package:equatable/equatable.dart';

abstract class RfqEvent extends Equatable {
  const RfqEvent();
  @override
  List<Object> get props => [];
}
class FetchRfqEvent extends RfqEvent {}
