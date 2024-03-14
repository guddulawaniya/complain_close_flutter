import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatefulWidget {
  final int numberOfFields;
  final Color borderColor;
  final bool showFieldAsBox;
  final Function(String) onCodeChanged;
  final Function(String) onSubmit;

  const OtpTextField({
    Key? key,
    required this.numberOfFields,
    this.borderColor = Colors.black,
    this.showFieldAsBox = true,
    required this.onCodeChanged,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.numberOfFields; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.numberOfFields,
        (index) => SizedBox(
          width: 50,
            child: TextField(
              style: TextStyle(fontWeight: FontWeight.bold),
              controller: _controllers[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counter: Text(""),
                border: widget.showFieldAsBox
                    ? OutlineInputBorder(
                        borderSide: BorderSide(color: widget.borderColor),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: widget.borderColor),
                      ),
              ),
              onChanged: (value) {
                widget.onCodeChanged(_getCode());
                if (value.isNotEmpty && index < widget.numberOfFields - 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              onSubmitted: (value) {
                if (index == widget.numberOfFields - 1) {
                  widget.onSubmit(_getCode());
                }
              },
            ),
          ),
        ),
    );
  }

  String _getCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
