// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:elearning_fe/constants/iconConstants.dart';
import 'package:elearning_fe/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final double? labelSize;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final bool? withObscureIcon;
  final bool? withPrefixIcon;
  final bool? withSuffixIcon;
  final bool? withThousandsSeparator;
  final String? prefixText;
  final String? prefixIconImagePath;
  final String? suffixText;
  final String? suffixIconImagePath;
  final bool enabled;
  final Function? onTap;
  final Function? onSave;
  final Function? onChanged;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool? matchWithDukcapil;
  final double? marginField;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? withMaxLength;
  final int? maxLength;
  final Color fillColor;
  final MaskTextInputFormatter? maskTextInputFormatter;

  const CustomTextField({
    this.textEditingController,
    this.label,
    this.labelSize,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.withObscureIcon = false,
    this.withPrefixIcon = false,
    this.withSuffixIcon = false,
    this.withThousandsSeparator = false,
    this.prefixText,
    this.prefixIconImagePath,
    this.suffixText,
    this.suffixIconImagePath,
    this.enabled = true,
    this.onTap,
    this.onSave,
    this.onChanged,
    this.keyboardType,
    this.textCapitalization,
    this.matchWithDukcapil,
    this.validator,
    this.withMaxLength = false,
    this.maxLength,
    this.marginField,
    this.fillColor = Colors.white,
    this.maskTextInputFormatter,
    Key? key,
    this.initialValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        margin: EdgeInsets.only(bottom: marginField ?? 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? '',
              style: labelSize != null
                  ? TextStyle(fontSize: labelSize)
                  : TextStyle(
                      fontSize: 12,
                      color: const Color(0xff99A0AF),
                    ),
            ),
            SizedBox(height: 6),
            TextFormField(
              initialValue: initialValue,
              controller: textEditingController,
              minLines: 1,
              maxLines: withObscureIcon! ? 1 : 4,
              style: TextStyle(height: 1.2, color: neutral80),
              decoration: InputDecoration(
                hintText: errorText ?? hintText,
                hintStyle: TextStyle(
                  color: errorText != null
                      ? Theme.of(context).errorColor
                      : darkGrey,
                ),
                suffixIcon: withSuffixIcon!
                    ? GestureDetector(
                        onTap: () => onTap!(),
                        child: Image.asset(
                          suffixIconImagePath!,
                          scale: 3,
                        ),
                      )
                    : withObscureIcon!
                        ? Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => onTap!(),
                              child: obscureText!
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          )
                        : null,
                // prefixIcon: prefixText != null
                //     ? Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Padding(
                //             padding:
                //                 const EdgeInsetsDirectional.only(start: 12.0),
                //             child: Text(
                //               prefixText!,
                //               style: TextStyle(color: Colors.grey.shade500),
                //             ),
                //           ),
                //         ],
                //       )
                //     : null,
                prefixIcon: withPrefixIcon!
                    ? GestureDetector(
                        onTap: () => onTap!(),
                        child: Image.asset(
                          prefixIconImagePath!,
                          scale: 3,
                        ),
                      )
                    : null,
                prefixText: prefixText != null ? prefixText! : null,
                suffixText: suffixText != null ? suffixText! : null,
                enabled: enabled,
                filled: true,
                fillColor: enabled ? fillColor : null,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: textEditingController != null &&
                            textEditingController!.text.isNotEmpty
                        ? Colors.green
                        : Colors.black38,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: textEditingController != null &&
                            textEditingController!.text.isNotEmpty &&
                            matchWithDukcapil == true
                        ? Colors.green
                        : matchWithDukcapil == false
                            ? const Color(0xffD70C24)
                            : Colors.black38,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: textEditingController != null &&
                            textEditingController!.text.isNotEmpty
                        ? Colors.green
                        : Colors.black38,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: textEditingController != null &&
                            textEditingController!.text.isNotEmpty
                        ? Colors.green
                        : secondaryBlue,
                  ),
                ),
                errorStyle: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).errorColor,
                ),
              ),
              obscureText: obscureText!,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              validator: validator,
              inputFormatters: withThousandsSeparator!
                  ? [maskTextInputFormatter!]
                  : withMaxLength!
                      ? [maskTextInputFormatter!]
                      : null,
              onSaved: onSave != null ? (val) => onSave!() : null,
              onChanged: onChanged != null ? (val) => onChanged!() : null,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? value;
  final List<String>? items;
  final Function(String?)? onChanged;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.hintText,
    this.value,
    required this.onChanged,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: const Color(0xff99A0AF), fontSize: 12),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 0.8),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: DropdownButtonFormField(
            value: value == '' ? null : value,
            onChanged: onChanged,
            style: TextStyle(
                color: neutral80, fontWeight: FontWeight.w400, fontSize: 16),
            dropdownColor: Colors.white,
            icon: Image.asset(IconConstants.chevronDown, scale: 2),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: darkGrey, fontSize: 16, fontWeight: FontWeight.w400),
              hintText: hintText,
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (dynamic value) {
              if (value == null) {
                return 'Lengkapi kolom ini';
              }
              return null;
            },
            items: items != null
                ? items!.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList()
                : null,
          ),
        ),
      ],
    );
  }
}
