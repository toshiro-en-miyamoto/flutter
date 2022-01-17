import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyVerification(),
    );
  }
}

class MyVerification extends StatefulWidget {
  final BorderSide borderSide;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const MyVerification({
    Key? key,
    this.borderSide = const BorderSide(),
    this.onChanged,
    this.controller,
  }) : super(key: key);
  @override
  State<MyVerification> createState() => _MyVerificationState();
}

class _MyVerificationState extends State<MyVerification> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        LengthLimitingTextInputFormatter(6),
      ],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: widget.borderSide,
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
    );
  }
}

class VerificationCodeFormField extends FormField<String> {
  final TextEditingController controller;

  VerificationCodeFormField({
    Key? key,
    FormFieldSetter<String>? onSaved,
    required this.controller,
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          validator: validator,
          builder: (FormFieldState<String> field) {
            _VerificationCodeFormFieldState state =
                field as _VerificationCodeFormFieldState;
            return MyVerification(
              controller: state._controller,
            );
          },
        );

  @override
  FormFieldState<String> createState() => _VerificationCodeFormFieldState();
}

class _VerificationCodeFormFieldState extends FormFieldState<String> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();

    _controller.addListener(_controllerChanged);
  }

  @override
  void reset() {
    super.reset();
    _controller.text = "";
  }

  void _controllerChanged() {
    didChange(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerChanged);
    super.dispose();
  }
}
