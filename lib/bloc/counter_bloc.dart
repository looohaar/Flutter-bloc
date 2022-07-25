import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
   on<Increment>((event, emit) {
         return emit(
          CounterState(count: state.count+1)
         );
   });
   on<Decrement>((event, emit){
    return emit(
      CounterState(count: state.count-1)
    );
   } );
   on<Reset>((event, emit){
    final finalState=0;
    return emit(
      
      CounterState(count: finalState)
    );
   });
  }
}
