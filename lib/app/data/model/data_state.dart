import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  @override
  bool get stringify => true;
}

class Initial extends DataState {
  @override
  List<Object> get props => [];
}

class Loading extends DataState {
  @override
  List<Object> get props => [];
}

class Loaded<T> extends DataState {
  final T? result;

  Loaded({this.result});

  @override
  List<Object> get props => [result.toString()];
}

class Error extends DataState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Empty extends DataState {
  @override
  List<Object> get props => [];
}
