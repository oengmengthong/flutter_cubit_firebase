import 'package:bloc/bloc.dart';
import '../../../data/entites/permission_role.dart';

class AuthState {
  final bool isAuthenticated;
  final PermissionRole userRole;

  AuthState(this.isAuthenticated, this.userRole);
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(false, PermissionRole.guest));

  // Function check auth firebase
  void checkAuth() {
    try{
      // Check auth firebase
      // ApiService().getCurrentUser();
      // If success
      emit(AuthState(true, PermissionRole.user));
    } catch(e) {
      emit(AuthState(false, PermissionRole.guest));
      return;
    }
  }

  void logIn() {
    emit(AuthState(true, PermissionRole.user ));
  }

  void logOut() {
    emit(AuthState(false, PermissionRole.guest));
  }
}
