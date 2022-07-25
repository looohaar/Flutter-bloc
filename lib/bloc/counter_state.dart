part of 'counter_bloc.dart';
 class CounterState {
  final int count;
  CounterState({required this.count});
 }

class InitialState extends CounterState {
 
  InitialState(): super(count: 0);
}
