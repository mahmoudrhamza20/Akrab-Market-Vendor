import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputFormField extends StatefulWidget {
  final String? hint;
  final Function(String)? validator;
  final Function? onPressed;
  final bool secure;
  final bool isNumber;
  final Function(String)? onSave;
  final int maxLines;
  final IconData? icon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function? onTap;
  final bool isNext;
  final int? maxLength;
  final String? upperText;
  final bool hasLabel;
  final Color? textColor;
  final bool isRTL;
  final double horizontalMargin;
  final bool multiLine;
  final Color? fillColor;

  const InputFormField({
    super.key,
    this.prefix,
    this.isNumber = false,
    @required this.controller,
    this.maxLines = 1,
    this.onPressed,
    this.onSave,
    this.secure = false,
    @required this.hint,
    @required this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.isNext = true,
    this.maxLength,
    this.upperText,
    this.hasLabel = false,
    this.isRTL = false,
    this.icon,
    @required this.textColor,
    this.horizontalMargin = 0,
    this.multiLine = false,
    @required this.fillColor,
  });

  @override
  InputFormFieldState createState() => InputFormFieldState();
}

class InputFormFieldState extends State<InputFormField> {
  final BorderRadius borderRadius = BorderRadius.circular(15);
  bool? _showPassword;

  @override
  void initState() {
    _showPassword = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          widget.horizontalMargin, 15, widget.horizontalMargin, 0),
      child: GestureDetector(
        onTap: () => widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.upperText != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  widget.upperText!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
              ),
            TextFormField(
              textAlign: TextAlign.right,
              controller: widget.controller,
              obscureText: _showPassword!,
              onSaved: (value) => widget.onSave,
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              textInputAction: widget.multiLine
                  ? TextInputAction.newline
                  : widget.isNext
                      ? TextInputAction.next
                      : TextInputAction.done,
              keyboardType: widget.multiLine
                  ? TextInputType.multiline
                  : widget.isNumber
                      ? TextInputType.number
                      : TextInputType.emailAddress,
              validator: (value) => widget.validator!(value!),
              maxLines: widget.maxLines,
              enabled: widget.onTap == null,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              style: TextStyle(color: widget.textColor),
              decoration: InputDecoration(
                  filled: true,
                  hintStyle:
                      TextStyle(color: widget.textColor, fontSize: 12.sp),
                  labelStyle: TextStyle(color: widget.textColor),
                  fillColor: widget.fillColor ?? const Color(0xFFEFEFEF),
                  counterStyle:
                      const TextStyle(fontSize: 0, color: Colors.transparent),
                  prefix: widget.prefix,
                  prefixIcon: widget.icon == null
                      ? null
                      : Icon(
                          widget.icon,
                          color: Colors.black,
                          size: 18,
                        ),
                  suffixIcon: widget.suffixIcon ??
                      (widget.secure
                          ? IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: Icon(
                                _showPassword!
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: Colors.black,
                                size: 14.sp,
                              ),
                              onPressed: () => setState(
                                  () => _showPassword = !_showPassword!),
                            )
                          : null),
                  hintText: widget.hasLabel ? null : widget.hint,
                  labelText: widget.hasLabel ? widget.hint : null,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: widget.maxLines == 1 ? 0 : 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: const BorderSide(color: Colors.black26),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
