part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}
class PaymentSuccessState extends PaymentState {}
class PaymentErrorState extends PaymentState {
  final String error;
  PaymentErrorState(this.error);
}

class PaymentOrderSuccessState extends PaymentState {}
class PaymentOrderErrorState extends PaymentState {
  final String error;
  PaymentOrderErrorState(this.error);
}


class PaymentFinalTokenSuccessState extends PaymentState {}

class PaymentFinalTokenErrorState extends PaymentState {
  final String error;
  PaymentFinalTokenErrorState(this.error);
}

class PaymentFinalTokenKioskSuccessState extends PaymentState {}
class PaymentFinalTokenKioskErrorState extends PaymentState {
  final String error;
  PaymentFinalTokenKioskErrorState(this.error);
}

class PaymentReferenceSuccessState extends PaymentState {}
class PaymentReferenceErrorState extends PaymentState {
  final String error;
  PaymentReferenceErrorState(this.error);
}
