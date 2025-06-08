import 'package:flutter/material.dart';
import 'package:investa4/core/utils/text_field_style.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({
    super.key,
    required this.hint,
    this.onDateSelected,
    this.validator,
  });

  final String hint;
  final Function(DateTime?)? onDateSelected;
  final String? Function(String?)? validator;
  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  TextEditingController controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: widget.validator,
      decoration: textFieldDecoration(
        widget.hint,
        isPassword: false,
        togglePassword: null,
        obscureText: false,
      ).copyWith(
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }
}
