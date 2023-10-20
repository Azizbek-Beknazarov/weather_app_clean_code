import 'package:equatable/equatable.dart';

abstract class Xato extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerXato extends Xato {
  final String xabar;

  ServerXato({required this.xabar});
}

class InternetXato extends Xato {
  final String xabar;

  InternetXato({required this.xabar});
}

class InvalidInputXato extends Xato {
  final String xabar;

  InvalidInputXato({required this.xabar});
}

class LocationDisabledXato extends Xato {}

class LocationPermessionXato extends Xato {}
