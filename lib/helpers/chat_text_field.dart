import 'package:flutter/material.dart';

class ChatTextFieldWidget extends StatefulWidget {
  final String hint;
  final String? defaultValue;
  final bool? isPassword;
  final Function(String value) onChange;
  const ChatTextFieldWidget({
    Key? key,
    this.isPassword,
    required this.hint,
    this.defaultValue,
    required this.onChange,
  }) : super(key: key);

  @override
  State<ChatTextFieldWidget> createState() => _ChatTextFieldWidgetState();
}

class _ChatTextFieldWidgetState extends State<ChatTextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultValue != null) {
      _controller.text = widget.defaultValue!;
    }
    // _controller.addListener(() {
    //   widget.onChange(_controller.text);
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 20, color: Colors.black),
      controller: _controller,
      obscureText: widget.isPassword ?? false,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        focusColor: Colors.grey.shade100,
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              widget.onChange(_controller.text);
              _controller.clear();
            },
            icon: const Icon(Icons.send, color: Colors.blue, size: 30)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
