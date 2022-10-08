import 'package:equatable/equatable.dart';

class ObHavoEntity extends Equatable{
  final String shaharNomi;
  final int harorat;
  final String tavsif;
  ObHavoEntity({
    required this.shaharNomi, required this.harorat, required this.tavsif
});

  @override

  List<Object?> get props => [shaharNomi, harorat, tavsif];
}