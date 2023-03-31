import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final Widget suffixIcon;
  final bool suffixIconTap;
  final String error;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final Function validator;
  final Function onFieldSubmitted;
  final Function onEditingComplete;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final double borderValue;
  final Color fillColor;
  final Color focusedBorderColor;
  final double focusedBorderWidth;
  final double borderRadius;
  final EdgeInsets contentPadding;
  final TextStyle hintStyle;
  final Color enabledBorderColor;
  final Color textColor;
  final int maxLength;


  const CustomTextFormField({
    Key key,
    this.controller,
    @required this.hintText,
    this.keyboardType,
    this.inputAction,
    this.obscureText,
    this.enabled,
    this.suffixIcon,
    this.suffixIconTap,
    this.error,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onChanged,
    this.borderValue,
    this.fillColor,
    this.focusedBorderColor,
    this.focusedBorderWidth,
    this.borderRadius,
    this.contentPadding,
    this.hintStyle,
    this.enabledBorderColor,
    this.textColor,
    this.maxLength
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.inputAction,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText ?? false,
      controller: widget.controller,
      enabled: widget.enabled ?? true,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: widget.enabledBorderColor != null
                ? BorderSide(color: widget.enabledBorderColor)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
          color: Colors.red,
        )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: widget.focusedBorderColor ?? Colors.blue,
                width: widget.focusedBorderWidth ?? 1.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: widget.focusedBorderColor ?? Colors.blue,
                width: widget.focusedBorderWidth ?? 1.0)),
        fillColor: widget.fillColor ?? Colors.white,
        filled: true,
        hintText: widget.hintText,
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius)
              : BorderRadius.circular(4.0),
          borderSide: widget.borderValue != null
              ? BorderSide(width: widget.borderValue)
              : BorderSide.none,
        ),
        hintStyle: widget.hintStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kGrayishBlue,
            ),
        errorText: widget.error ?? null,
        suffixIcon: (widget.obscureText != null && widget.obscureText)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: _obscureText ? kGrayishBlue : kDarkGrayishBlue,
                    size: 20,
                  ),
                ),
              )
            : widget.suffixIcon,
      ),
      style: TextStyle(
        fontSize: 16,
        color: widget.textColor ?? Color(0xff575757),
        fontFamily: 'Nunito',
      ),
      cursorColor: kDesaturatedBlue,
      cursorWidth: 1,
    );
  }
}
