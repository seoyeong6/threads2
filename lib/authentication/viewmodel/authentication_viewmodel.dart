import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/authentication/repos/authentication_repo.dart';
import 'dart:async';

class AuthenticationViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
    return null;
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signUp(email, password);
    });
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signIn(email, password);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signOut();
    });
  }
}

final authViewModelProvider =
    AsyncNotifierProvider<AuthenticationViewModel, void>(() {
      return AuthenticationViewModel();
    });

final signUpFormProvider = StateProvider<Map<String, String>>((ref) => {});
final loginFormProvider = StateProvider<Map<String, String>>((ref) => {});
