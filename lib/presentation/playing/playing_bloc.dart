import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'playing_event.dart';
part 'playing_state.dart';

class PlayingBloc extends Bloc<PlayingEvent, PlayingState> {
  PlayingBloc() : super(PlayingInitial()) {
    on<PlayingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
