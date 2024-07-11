import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {

    });

    on<LoginSuccessEvent>((event, state)async{
      try{
        await Repo().signIn(event.gmail, event.password);
        emit(LoginSuccess());
      }
      catch(e){
        emit(LoginError('Did not logged in'));
      }
    });
  }
}