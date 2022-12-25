import 'package:customerapp/src/resources/_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String? header;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  const CTextField({Key? key,
    this.controller,
    this.isPassword = false,
    this.header,
    this.hintText,
    this.validator,
    this.textInputType,
    this.textInputFormatter
  }) : super(key: key);

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.header != null) Padding(
          padding: const EdgeInsets.only(
            bottom: 4
          ),
          child: Text(
            widget.header!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff222222)
            ),
          ),
        ),
        Stack(
          children: [
            TextFormField(
              keyboardType: widget.textInputType,
              inputFormatters: widget.textInputFormatter,
              validator: widget.validator,
              obscureText: widget.isPassword ? !showPassword : false,
              style: TextStyle(
                fontSize: 16
              ),
              cursorColor: CColors.primary,
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF5F5F5),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: widget.hintText ?? widget.header,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: CColors.grey_light
                )
              ),
            ),
            if(widget.isPassword) Positioned(
              top: 0,
              bottom: 0,
              right: 8,
              child: IconButton(
                onPressed: (){
                  setState((){
                    showPassword = !showPassword;
                  });
                },
                constraints: BoxConstraints(),
                icon: Icon(
                  !showPassword ? Icons.visibility : Icons.visibility_off,
                  color: CColors.grey_light,
                )
              ),
            )
          ],
        ),
      ],
    );
  }
}

