import '../domain /bottle_model.dart';

abstract class BottleState {}

class BottleInitial extends BottleState {}

class BottleLoading extends BottleState {}

class BottleLoaded extends BottleState {
  final List<Bottle> bottles;

  BottleLoaded(this.bottles);
}

class BottleError extends BottleState {
  final String error;

  BottleError(this.error);
}
