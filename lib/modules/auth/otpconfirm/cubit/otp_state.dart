abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpTimerTickingState extends OtpStates {}

class OtpLoadingState extends OtpStates {}

class OtpSuccessState extends OtpStates {}

class OtpErrorState extends OtpStates {
  final String error;
  OtpErrorState(this.error);
}