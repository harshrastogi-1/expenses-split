import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? errorMessage;

  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final TextEditingController? textEditingController;
  final InputBorder? outlineInputBorder;
  final InputBorder? focusedBorder;
  final Function? validator;
  final Function? onChange;
  final Function? onSaved;
  final Function? onSubmit;
  final List<TextInputFormatter>? inputFormatter;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final VoidCallback? toggleVisibility;
  final bool isPasswordField;

  final TextInputType? keyBoardType;
  final Color? suffixIconColor;
  final bool? isHidden;
  final bool autoFocus;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? minLength;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization? textCapitalization;

  const CustomTextFormField(
      {Key? key,
      this.maxLines,
      this.isHidden = true,
      this.autoFocus = false,
      this.focusNode,
      this.enabled = true,
      this.suffixIconPath,
      this.keyBoardType = TextInputType.emailAddress,
      this.isPasswordField = false,
      this.toggleVisibility,
      this.prefixIconPath,
      this.inputFormatter,
      this.suffixIconColor,
      this.hint,
      this.label,
      this.style,
      this.onChange,
      this.onSaved,
      this.onSubmit,
      this.validator,
      this.labelStyle,
      this.errorStyle,
      this.hintStyle,
      this.outlineInputBorder,
      this.focusedBorder,
      this.maxLength,
      this.textInputAction,
      this.errorMessage,
      required this.textEditingController,
      this.fillColor,
      this.filled,
      this.suffixIcon,
      this.contentPadding,
      this.minLength,
      this.textCapitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decorationStyle = Theme.of(context).inputDecorationTheme;

    return SizedBox(
      child: _textFormField(decorationStyle, context),
    );
  }

  Widget _textFormField(
      InputDecorationTheme decorationStyle, BuildContext context) {
    return Column(
      children: [
        TextFormField(
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            maxLines: maxLines,
            showCursor: true,
            autofocus: autoFocus,
            style: style,
            focusNode: focusNode,
            enabled: enabled,
            autocorrect: true,
            enableSuggestions: true,
            maxLength: maxLength ?? TextField.noMaxLength,
            minLines: minLength ?? 1,
            cursorColor: Theme.of(context).primaryColor,
            controller: textEditingController,
            textInputAction: textInputAction ?? TextInputAction.done,
            validator: (val) => validator!(val),
            onSaved: (val) => onSaved!(val),
            onChanged: (val) => onChange!(val),
            inputFormatters: inputFormatter ?? [],
            obscureText: isPasswordField ? isHidden ?? false : false,
            keyboardType: keyBoardType ?? TextInputType.name,
            onFieldSubmitted: (val) => onSubmit!(val),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: contentPadding ?? const EdgeInsets.all(14),
              hintText: hint ?? "",
              //   labelText:  "",
              enabledBorder: outlineInputBorder ?? decorationStyle.border,
              //  labelStyle: labelStyle ?? decorationStyle.labelStyle,
              hintStyle: hintStyle ?? decorationStyle.hintStyle,
              border: outlineInputBorder ?? decorationStyle.border,
              errorBorder: outlineInputBorder ?? decorationStyle.border,
              focusedBorder: focusedBorder ?? decorationStyle.focusedBorder,
              focusedErrorBorder: outlineInputBorder ?? decorationStyle.border,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              errorMaxLines: 2,
              fillColor: fillColor ?? Colors.transparent,
              filled: filled ?? false,
              prefixIcon: prefixIconPath != null
                  ? ImageIcon(
                      AssetImage(prefixIconPath ?? ""),
                    )
                  : null,
              suffixIcon: isPasswordField
                  ? IconButton(
                      onPressed: toggleVisibility,
                      icon: suffixIconPath != null
                          ? ImageIcon(
                              AssetImage(suffixIconPath ?? ""),
                            )
                          : isHidden ?? false
                              ? Icon(
                                  Icons.password,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.password,
                                  // StoreFontIcon.eyeOpenIcon,
                                  color: Theme.of(context).primaryColor,
                                ),
                    )
                  : suffixIcon,
            )),
        (errorMessage != null)
            ? Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(
                  errorMessage ?? "",
                  style: errorStyle ?? decorationStyle.errorStyle,
                ),
              )
            : Container()
      ],
    );
  }
}
