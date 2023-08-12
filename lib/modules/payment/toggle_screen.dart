import 'package:flutter/material.dart';
import 'package:paymom_app/modules/payment/ref_card_screen.dart';
import 'package:paymom_app/modules/payment/visa_card_screen.dart';
import 'package:paymom_app/shared/components/components.dart';
import 'package:paymom_app/shared/styles/style.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
            Expanded(child: InkWell(
              onTap: (){
                navigateAndFinish(context, VisaCardScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: defColor,width: 1.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/advance-visa.jpg',),
                    const SizedBox(height: 16.0,),
                    const Text('Payment With Card',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0
                    ),)
                  ],
                ),
              ),
            )),
            SizedBox(height: 32.0,),
            Expanded
              (child: GestureDetector(
              onTap: (){
                navigateAndFinish(context, const ReferenceCardScreen());

              },
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: defColor,width: 1.2),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ref_code_images.jpeg',height: 250,),
                    const SizedBox(height: 16.0,),
                    const Text('Payment With Ref Code',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0
                    ),)
                  ],
                ),
            ),
              )
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
