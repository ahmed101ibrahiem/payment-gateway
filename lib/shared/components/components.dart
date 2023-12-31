import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future<bool?> showToast({required String message, Color color = Colors.black}) {
  return Fluttertoast.showToast(
    msg: message.trim(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 14,
  );
}

Widget defaultButton(
{
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}
    ){

  return Container(
    width: width,
    height: 40.0,
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: MaterialButton(
      onPressed: function,
      child: Text(isUpperCase?text.toUpperCase():text,style: TextStyle(
        color: Colors.white,

      ),),
    ),
  );
}


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  ValueChanged<String>? onSubmitted,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefixIconData,
   IconData? suffixIconData,
  VoidCallback? suffixPressed,
  bool? isClickable = true,
  int? lines,



}){
  return TextFormField(
    controller:controller ,
    keyboardType: keyboardType,
    obscureText: isPassword,
    enabled: isClickable,
    onFieldSubmitted: onSubmitted,
    onChanged: onChange,
    onTap: onTap,
    maxLines: lines,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIconData),
      suffixIcon: suffixIconData !=null?IconButton(onPressed: suffixPressed, icon: Icon(
        suffixIconData
      )):null,
      border: const OutlineInputBorder()
    ),
  );
}
void navigateTo(context, widget)=>
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
Future<void> navigateAndFinish(context,widget){
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget,), (route) => false);
}