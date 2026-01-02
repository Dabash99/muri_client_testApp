import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:muri_client/shared/network/remote/dio_helper.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);

  // ================= Timer Logic =================
  Timer? _timer;
  int start = 120; // 2 Minutes (120 seconds)
  bool isTimerRunning = false;

  void startTimer() {
    if (isTimerRunning) return;

    start = 120;
    isTimerRunning = true;
    emit(OtpTimerTickingState());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        // انتهى الوقت
        isTimerRunning = false;
        timer.cancel();
        emit(OtpTimerTickingState());
      } else {
        start--;
        emit(OtpTimerTickingState());
      }
    });
  }

  // دالة لتحويل الثواني إلى صيغة 02:00
  String getTimerText() {
    int minutes = start ~/ 60;
    int seconds = start % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  // ================= API Logic =================
  void submitOtp({
    required String otpCode,
    required String email,
  }) {
    emit(OtpLoadingState());

    DioHelper.postData(
      url: '/api/clients/users/verifyAccount/',
      data: {
        'email': email,
        'otp': otpCode,
      },
    ).then((value) {
      print('OTP Response: ${value.data}');

      emit(OtpSuccessState());

    }).catchError((error) {
      print(error.toString());

      String errorMsg = 'حدث خطأ غير متوقع';

      if (error is DioException) {
        if (error.response != null && error.response?.data != null) {
          errorMsg = error.response?.data['message'] ?? error.message;
        }
      }

      emit(OtpErrorState(errorMsg));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}