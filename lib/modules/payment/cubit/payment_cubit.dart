import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymom_app/shared/constant.dart';
import 'package:paymom_app/shared/network/dio_helper.dart';
part 'payment_state.dart';


class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFirstToken({required String price, required String firstName,
    required String lastName,
    required String email,
    required String phone,}) async {
    DioHelperPayment.postData(url: 'auth/tokens', data: {'api_key': apiKey}).
    then((value) {
      print('falit is here');
      firstToken = value.data['token'].toString();
      if (kDebugMode) {
        print('Token : $firstToken');
      }
      getOrderId(price: price,
        phone: phone,
        lastName: lastName,
        firstName: firstName,
        email: email
      );
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(PaymentErrorState(error));
    });
  }

  Future getOrderId({required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    DioHelperPayment.postData(url: 'ecommerce/orders', data: {
      'auth_token': firstToken,
      'delivery_needed': 'false',
      'amount_cents': price,
      'billing_data':{
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      'items': [],
      'currency': 'EGP'
    }).
    then((value) {
      // make get order is string to avoid problem
      orderId = value.data['id'].toString();
      if (kDebugMode) {
        print('Order Id : $orderId');
      }
      getFinalToken(email: email,price: price,firstName: firstName,lastName: lastName,phone: phone);
      getFinalTokenKiosk(price: price, firstName: firstName, lastName: lastName, email: email, phone: phone);
      emit(PaymentOrderSuccessState());
    }).catchError((error) {
      emit(PaymentOrderErrorState(error));
    });
  }

  Future<void> getFinalToken({required String price,
  required String firstName,
  required String lastName,
  required String email,
  required String phone,

  }) async {
    DioHelperPayment.postData(
        url: 'acceptance/payment_keys',
        data: {
          "auth_token": firstToken,
          "amount_cents": price,
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationIdCard,
          "lock_order_when_paid": "false"
    })
        .then((value) {
          finalTokenCard = value.data['token'];
          debugPrint('final token : $finalTokenCard');
          emit(PaymentFinalTokenSuccessState());
    })
        .catchError((error) {
      emit(PaymentFinalTokenErrorState(error));
    });
  }


  // reference code
  Future<void> getFinalTokenKiosk({required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,

  }) async {
    DioHelperPayment.postData(
        url: 'acceptance/payment_keys',
        data: {
          "auth_token": firstToken,
          "amount_cents": price,
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": integrationIdKiosk,
          "lock_order_when_paid": "false"
        })
        .then((value) {
      finalTokenKiosk = value.data['token'];
      debugPrint('kiosk token : $finalTokenKiosk');
      getReferenceCode();
      emit(PaymentFinalTokenKioskSuccessState());
    })
        .catchError((error) {
      emit(PaymentFinalTokenKioskErrorState(error));
    });
  }

  Future getReferenceCode()async{
    DioHelperPayment.postData(url: 'acceptance/payments/pay',
        data: {
            "source": {
              "identifier": "AGGREGATOR",
              "subtype": "AGGREGATOR"
            },
            "payment_token": finalTokenKiosk
        })
        .then((value) {
    //  OrderModel myData = OrderModel.fromJson(value.data['order']);
         // refCode = myData.id.toString();
     refCode = value.data['id'].toString();
          debugPrint('refCode : $refCode');
          emit(PaymentReferenceSuccessState());
    }).
    catchError((error){
      emit(PaymentReferenceErrorState(error));
    });
  }

}
