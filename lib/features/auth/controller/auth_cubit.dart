import 'package:bloc/bloc.dart';
import 'package:card/features/auth/data/auth_repo.dart';

part 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthData authData = AuthData();

  Future<void> login({required String username, required String password}) async {
    emit(AuthLoading());

    try {
      final token = await authData.authUser(username, password);
      print("TOKEN: $token");
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
