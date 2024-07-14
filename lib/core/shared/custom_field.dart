import 'package:flutter/material.dart';
import 'package:untitled1/core/constants/app_colors.dart';

import '../../../../core/constants/dimensions.dart';
import 'custom_title.dart';

class CustomField extends StatefulWidget {
    CustomField(
      {super.key,
       this.prefixIcon,
       this.label,
      required this.hint,
       this.onChanged,
      this.textInputType = TextInputType.text,
      this.isPassword,
        this.controller,
        this.isFilled = true,
       this.validator});
  final Widget? prefixIcon;
  final TextInputType textInputType;
  final String? label;
  final String hint;
  final bool isFilled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  late bool? isPassword;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          text: widget.label!,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                
                  offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
                color: AppColors.kMainColorBlack.withOpacity(0.15)
                
              )
            ]
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.textInputType,
            onChanged: widget.onChanged,
            obscureText: widget.isPassword != null ? widget.isPassword! : false,
            decoration: InputDecoration(

              filled: widget.isFilled,
              fillColor: Colors.white,
              // Background color
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
              // Hint text color
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(1), // Border radius
                borderSide: BorderSide.none,
                // No border side
              ),
              // suffixIcon: widget.isPassword != null
              //     ? IconButton(
              //         onPressed: () {
              //           setState(() {
              //             widget.isPassword = !widget.isPassword!;
              //           });
              //         },
              //         icon: widget.isPassword!
              //             ? const Icon(Icons.visibility_off)
              //             : const Icon(Icons.visibility))
              //     : null,
              // prefixIcon: widget.prefixIcon, // Prefix icon
            ),
          ),
        ),
      ],
    );
  }
}
