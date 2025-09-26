import 'package:bloc/bloc.dart';
import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // نحافظ على login زي ما هو في المنطق؛ بس سمّي المتغيّر response بدل Response
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final response = await AuthRepo.login(email: email, password: password);
    if (response is String) {
      emit(LoginErrorState(response));
    } else {
      emit(LoginSuccessState());
    }
  }

  // register داخل الكلاس وبتستخدم AuthRepo.register (static) بدون _repo
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String? phone,
  }) async {
    emit(RegisterLoadingState());
    final response = await AuthRepo.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phone: phone,
    );
    if (response is String) {
      emit(RegisterErrorState(response));
    } else {
      emit(RegisterSuccessState());
    }
  }
}
