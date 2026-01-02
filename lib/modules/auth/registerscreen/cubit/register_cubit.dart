import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  IconData suffixIcon = Icons.visibility_outlined;
  IconData confirmSuffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffixIcon = isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    confirmSuffixIcon = isConfirmPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  String selectedCountryCode = '+966';

  void updateCountryCode(String code) {
    selectedCountryCode = code;
    emit(RegisterChangeCountryCodeState());
  }

  void userRegister({
    required String firstName,
    required String secondName,
    required String familyName,
    required String email,
    required String birthDate,
    required String nationalId,
    required String phone,
    required String password,
    required String confirmPassword,
    required String nationality,
  }) {
    emit(RegisterLoadingState());


    DioHelper.postData(
      url: 'api/clients/users/',
      data: {
        'first_name': firstName,
        'second_name': secondName,
        'last_name': familyName,
        'email': email,
        'birth_date': birthDate,
        'identity_number': nationalId,
        'phone': selectedCountryCode + phone,
        'password': password,
        'nationality':'Egyptian'
      },
    ).then((value) {
      print(value.data);
      print(selectedCountryCode + phone);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioException && error.response != null) {
        emit(RegisterErrorState(error.response?.data['message'] ?? 'حدث خطأ ما'));
      } else {
        emit(RegisterErrorState(error.toString()));
      }
    });
  }
}