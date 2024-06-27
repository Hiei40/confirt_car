abstract class AuthMainState {}

class AuthInitState extends AuthMainState {}

class SignInState extends AuthMainState {}

class SignUpState extends AuthMainState {}
class LoginSuccful extends AuthMainState {}
class SignInStateError extends AuthMainState {
  final String Error;

  SignInStateError({required this.Error});

}

class CreateProfileState extends AuthMainState {}

class EmptyLoginState extends AuthMainState {}

class DropDownSubCategory extends AuthMainState {}

class HidePasswordState extends AuthMainState {}