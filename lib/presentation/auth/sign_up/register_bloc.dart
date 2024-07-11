import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo.dart';

part 'register_event.dart';
part 'register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {

    });

    on<RegisterUser>((event, state)async{
      try{
        await Repo().signUp(event.email, event.password);
        emit(RegisterSuccess());
      }catch(e){
        emit(RegisterError('Could not register'));
      }
    });


  }
}
