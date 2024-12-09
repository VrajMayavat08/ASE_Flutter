import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> formFields;
  final String submitButtonText;
  final Function onSubmit;

  CustomForm({
    required this.formKey,
    required this.formFields,
    required this.submitButtonText,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...formFields,
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onSubmit(),
            child: Text(submitButtonText),
          ),
        ],
      ),
    );
  }
}
