import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cinefy/domain/timer/timer_states.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial());

  Timer? _timer;

  startTimer([int? time]) {
    if (time != null) {
      emit(TimerProgress(time));
    } else {
      emit(const TimerProgress(0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  onTick(Timer timer) {
    if (state is TimerProgress) {
      TimerProgress timerProgress = state as TimerProgress;
      if (timerProgress.elapsed! > 0) {
        emit(TimerProgress(timerProgress.elapsed! - 1));
      } else {
        _timer!.cancel();
        emit(const TimerInitial());
      }
    }
  }
}
