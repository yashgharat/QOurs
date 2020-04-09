import 'package:flutter/material.dart';
import '../extensions/hex_color.dart';
import 'package:condition/condition.dart';

import 'styled_form_field.dart';

class UserTextField extends StatefulWidget {
   String hintText;
   bool obscureText;
   bool isPassword;
   Icon icon;
   TextEditingController textController;

   UserTextField(this.hintText, this.obscureText,
       this.textController, this.icon, this.isPassword);
   @override
   _UserTextField createState() => _UserTextField();

}

class _UserTextField extends State<UserTextField> {
   Icon passIcon;
//   if (widget.obscureText)
//   {
//      passIcon= Icon(
//         Icons.visibility,
//         size: 48.0,
//         color: HexColor.fromHex('D4BFF9'));
//   }
   TextStyle style = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 24,
      color: Colors.black87,
   );
   Widget build(BuildContext context) {
      return Container(
         width: 450.0,
         height: 72.0,
         child: TextFormField(
            obscureText: widget.obscureText,
            controller: widget.textController,
            style: style,
            decoration: InputDecoration(
                prefixIcon: Padding(
                   padding: const EdgeInsetsDirectional.only(start: 12.0, end: 30.0),
                   child: widget.icon,
                ),
                suffixIcon: Conditioned.boolean(widget.isPassword ==  true,
                   trueBuilder: () => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20.0),
                      child: IconButton(
                         icon: Icon(
                            widget.obscureText ?
                            Icons.visibility : Icons.visibility_off,
                            size: 32.0,
                            color: Colors.black87,
                         ),
                         onPressed: () {
                            setState(() {
                               widget.obscureText = !widget.obscureText;
                            });
                         },
                      ),
                   ),

                   falseBuilder: () => Container(width: 0, height: 0,),
                  ),
//                suffixIcon: Padding(
//                   padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
//                   child: Conditioned.boolean(widget.isPassword == true,
//                      trueBuilder: () => IconButton(
//                         icon: Icon(
//                            widget.obscureText ?
//                            Icons.visibility : Icons.visibility_off,
//                            size: 48.0,
//                            color: Colors.black87,
//                         ),
//                         onPressed: () {
//                            setState(() {
//                               widget.obscureText = !widget.obscureText;
//                            });
//                         },
//                      ),
//                      falseBuilder: () => Container(width: 0, height: 0,),
//                   ),
//                ),
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hintText,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
         ),
      );
   }
}

//class UserField extends StatefulWidget {
//
//}