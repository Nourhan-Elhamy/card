part of 'auth_cubit.dart';

abstract class AuthState {}

 class AuthInitial extends AuthState {}
 class AuthSuccess extends AuthState {}
class AuthFailure extends AuthState {
 final String error;
 AuthFailure({required this.error});
}
class AuthLoading extends AuthState {}
