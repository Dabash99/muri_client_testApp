import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muri_client/shared/network/remote/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: 'api/clients/login/',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());

      String errorMessage = "Error";

      if (error is DioException) {
        if (error.response!.data['detail'] != null && error.response!.data != null) {

            errorMessage = error.response!.data['detail'];
        }
      }

      emit(LoginErrorState(errorMessage));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(LoginChangePasswordVisibilityState());
  }
}