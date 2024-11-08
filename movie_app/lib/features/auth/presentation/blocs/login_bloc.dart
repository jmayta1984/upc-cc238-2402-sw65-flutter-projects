import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/remote/auth_service.dart';
import 'package:movie_app/features/auth/data/remote/login_dto.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_event.dart';
import 'package:movie_app/features/auth/presentation/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(
      (event, emit) async {
        emit(LoginLoading());
        LoginDto? loginDto =
            await AuthService().login(event.username, event.password);
        if (loginDto != null) {
          emit(LoginSuccess(loginDto: loginDto));
        } else {
          emit(const LoginError(message: 'Wrong credentials'));
        }
      },
    );
  }
}
