import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paymom_app/modules/register/register.dart';
import 'package:paymom_app/shared/components/components.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../shared/constant.dart';
import '../../shared/styles/style.dart';


class VisaCardScreen extends StatefulWidget {
   VisaCardScreen({Key? key}) : super(key: key);

  @override
  State<VisaCardScreen> createState() => _VisaCardScreenState();
}

class _VisaCardScreenState extends State<VisaCardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: defColor,
        actions: [
          IconButton(onPressed: (){
            exit(context);
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://accept.paymob.com/api/acceptance/iframes/705872?payment_token=$finalTokenCard",
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        ),
      ),
    );
  }

  exit(BuildContext context){
    showDialog(context: context, builder:(_)=>
    AlertDialog(
      title: Text('Are you sure completed app payment',style: TextStyle(
        color: defColor,fontSize: 14.0,
      ),),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          navigateAndFinish(context, RegisterScreen());
    }, child: const Text('Yes')),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text('No'))
      ],
    ));
  }
   JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
     return JavascriptChannel(
         name: 'Toaster',
         onMessageReceived: (JavascriptMessage message) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(message.message)),
           );
         });
}
}
