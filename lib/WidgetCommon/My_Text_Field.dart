import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key? key,
    required this.myController,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.onValidator,
    required this.keyBoardType,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    this.icon = const Icon(Icons.visibility_off),
    this.enable = true,
    this.autoFocus = false,
    required TextStyle hintStyle,
  }) : super(key: key);

  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;

  final Icon icon;
  final TextInputType keyBoardType;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        obscureText: obscureText,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 19, color: Colors.grey),
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? ValueListenableBuilder<bool>(
                  valueListenable: _toggle,
                  builder: (context, value, child) {
                    return IconButton(
                      icon: Icon(
                        value ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      onPressed: () {
                        _toggle.value = !_toggle.value;
                      },
                    );
                  },
                )
              : null,
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          label: Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14, color: Colors.blue),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 18, height: 0, color: Colors.black),
        ),
      ),
    );
  }
}
