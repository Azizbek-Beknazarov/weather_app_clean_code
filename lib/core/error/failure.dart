import 'package:equatable/equatable.dart';

abstract class Xato extends Equatable {
  final List xususiyat;
  Xato([this.xususiyat = const <dynamic>[]]);

  @override
  List<Object> get props => [xususiyat];
}

class ServerXato extends Xato {
  final String xabar;
  ServerXato({required this.xabar}) : super([xabar]);
}

class CacheXato extends Xato {}

class InvalidInputXato extends Xato {}

// class LocationDisabledFailure extends Xato {}
//
// class LocationPermessionFailure extends Xato {}