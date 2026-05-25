import 'package:equatable/equatable.dart';

class InvoiceEntity extends Equatable {
  final String id;
  final String name;

  const InvoiceEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
