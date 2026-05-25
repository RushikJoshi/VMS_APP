import 'package:equatable/equatable.dart';

abstract class GrnEvent extends Equatable {
  const GrnEvent();
  @override
  List<Object> get props => [];
}
class FetchGrnEvent extends GrnEvent {}
