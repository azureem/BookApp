// import 'package:bloc/bloc.dart';
// import 'package:flutter_firebase_book_app/data/pref/my_shared.dart';
// import 'package:flutter_firebase_book_app/domain/repository_auth.dart';
// import 'package:meta/meta.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial(false,"")) {
//     var auth = RepositoryAuth();
//     var myShared = MyShared();
//     on<LoginUserEmailInPassword>((event, emit) async {
//       var boolean = await auth.signIn(event.email, event.password);
//       if(boolean){
//         myShared.setHasLogin(true);
//         emit(LoginInitial(true, ""));
//       }else{
//         emit(LoginInitial(false, "Password yoki Emailda xatolik bor"));
//       }
//     });
//   }
// }
