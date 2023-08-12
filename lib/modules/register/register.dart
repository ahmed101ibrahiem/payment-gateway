import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymom_app/modules/payment/cubit/payment_cubit.dart';
import 'package:paymom_app/modules/payment/toggle_screen.dart';
import 'package:paymom_app/shared/components/components.dart';

import '../../shared/styles/style.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Integration'),
        backgroundColor: defColor,
      ),
      body: BlocProvider(
        create: (context) => PaymentCubit(),
        child: BlocConsumer<PaymentCubit,PaymentState>(
            listener: (context, state) {
              if(state is PaymentReferenceSuccessState){
                 navigateTo(context, const ToggleScreen());
               }
            },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // First Name
                        defaultFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.text,
                            validate: (String? validate) {
                              if (validate!.isEmpty) {
                                return 'Please Enter your First Name';
                              }
                            },
                            label: 'First Name',
                            prefixIconData: Icons.person),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // last name
                        defaultFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.text,
                            validate: (String? validate) {
                              if (validate!.isEmpty) {
                                return 'Please Enter your Last Name';
                              }
                            },
                            label: 'Last Name',
                            prefixIconData: Icons.person),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // email
                        defaultFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (String? validate) {
                              if (validate!.isEmpty) {
                                return 'Please Enter your Email';
                              }
                            },
                            label: 'Email',
                            prefixIconData: Icons.email),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // phone
                        defaultFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validate: (String? validate) {
                              if (validate!.isEmpty) {
                                return 'Please Enter your Phone Number';
                              }
                            },
                            label: 'Phone Number',
                            prefixIconData: Icons.phone),
                        const SizedBox(
                          height: 20.0,
                        ),

                        // price
                        defaultFormField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            validate: (String? validate) {
                              if (validate!.isEmpty) {
                                return 'Please Enter your Price';
                              }
                            },
                            label: 'Price',
                            prefixIconData: Icons.price_check_outlined),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(function: () async{
                          if(formKey.currentState!.validate()){
                            PaymentCubit.get(context).getFirstToken(
                            price: priceController.text,
                              email: emailController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: phoneController.text,
                            );
                          }

                        },
                            text: 'Go To Pay',
                            background: defColor)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
