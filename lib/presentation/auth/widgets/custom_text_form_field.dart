import 'package:flutter/material.dart';
import 'package:spotify/core/config/size_config.dart';
import 'package:spotify/core/resourses/width_size_manager.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String hintText;
    final TextEditingController controller;

  bool isSecurse;

  CustomTextFormField(
      {super.key, required this.hintText, required this.isSecurse,required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  IconData iconsuffix = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * WidthSizeManager.s30),
      child: Material(
         elevation: 0,  // Ensure no clipping occurs
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isSecurse,
          decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: widget.hintText == "Password"
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isSecurse = !widget.isSecurse;
                              iconsuffix = iconsuffix == Icons.visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility;
                            });
                          },
                          icon: Icon(iconsuffix),
                        )
                      : null)
              .applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
      ),
    );
  }
}
