import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.textController,
    required this.hintText,
    this.icon,
    this.isObsecure = false,
    this.iconColor = const Color(0xFF18205F),
    this.maxLine = 1,
    this.keyboardType,
    this.readOnly = false,
    this.isMargin = true,
    this.onChanged,
    this.headingText,
    this.inputAction = TextInputAction.done,
    this.suffixIcon,
    this.isHiddenColor = false,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.onEditingComplete,
    this.onTap,
    this.autovalidateMode,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController? textController;
  final String? headingText, hintText;
  final IconData? icon;
  final bool isObsecure;
  final Color? iconColor;
  final int maxLine;
  final bool readOnly, isMargin, isHiddenColor;
  final TextInputType? keyboardType;
  final TextInputAction inputAction;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final int? maxLength;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onTap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (headingText != null)
          Container(
            margin: EdgeInsets.only(
                left: isMargin ? Dimens.w10 : 0,
                right: isMargin ? Dimens.w10 : 0,
                bottom: Dimens.h10 / 2),
            child: Text(headingText!, style: AppStyles.style13Bold),
          ),
        Container(
          height: keyboardType != TextInputType.multiline
              ? kMinInteractiveDimension
              : null,
          margin: isMargin
              ? EdgeInsets.only(left: Dimens.w10, right: Dimens.w10)
              : null,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLine,
            maxLength: maxLength,
            minLines: minLines,
            controller: textController,
            textInputAction: inputAction,
            keyboardType: keyboardType,
            obscureText: isObsecure,
            readOnly: readOnly,
            validator: validator,
            onChanged: onChanged,
            autovalidateMode: autovalidateMode,
            focusNode: focusNode,
            style: !readOnly ? AppStyles.style12Bold : AppStyles.style12Normal,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
            inputFormatters: inputFormatters,
            onEditingComplete: onEditingComplete,
          ),
        )
      ],
    );
  }
}
