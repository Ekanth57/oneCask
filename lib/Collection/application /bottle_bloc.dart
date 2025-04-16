import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/network_utils.dart';
import '../domain /bottle_model.dart';
import 'bottle_event.dart';
import 'bottle_state.dart';


class BottleBloc extends Bloc<BottleEvent, BottleState> {
  BottleBloc() : super(BottleInitial()) {
    on<FetchBottlesEvent>((event, emit) async {
      emit(BottleLoading()); // Show loading state
      try {
        List<Bottle> bottles = await fetchBottles();  // Fetch bottles from local or network
        emit(BottleLoaded(bottles));  // Emit the loaded state with fetched bottles
      } catch (e) {
        emit(BottleError('Failed to load bottles: $e'));  // Emit error state if fetching fails
      }
    });
  }
}

