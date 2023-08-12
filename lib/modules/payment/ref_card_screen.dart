import 'package:flutter/material.dart';
import 'package:paymom_app/shared/constant.dart';
import 'package:paymom_app/shared/styles/style.dart';

class ReferenceCardScreen extends StatelessWidget {
  const ReferenceCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Should Go To Any Market To Pay',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),),
            const SizedBox(height: 16.0,),
            Text('This Is Reference Code',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black
            ),),
            const SizedBox(height: 24.0,),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: defColor,width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(refCode,style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),),
              ),
            )
          ],
        ),
      )),
    );
  }
}
