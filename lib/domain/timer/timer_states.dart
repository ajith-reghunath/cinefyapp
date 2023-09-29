import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int? elapsed;
  const TimerState(this.elapsed);
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);

  @override
  List<Object?> get props => [];
}

class TimerProgress extends TimerState {
  const TimerProgress(int? elapsed) : super(elapsed);
  
  @override
  List<Object?> get props => [elapsed];
}
