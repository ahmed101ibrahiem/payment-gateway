import 'package:flutter/material.dart';
import 'package:paymom_app/modules/register/register.dart';
import 'package:paymom_app/shared/network/dio_helper.dart';

void main() async{
  await DioHelperPayment.init();
  runApp( PaymentApp());
}

class PaymentApp extends StatelessWidget {
   const PaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: RegisterScreen(),
    );
  }
}
