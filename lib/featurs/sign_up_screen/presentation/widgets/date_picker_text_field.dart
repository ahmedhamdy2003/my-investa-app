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

    // **[FIXED]** هذا هو الجزء الذي تم تعديله لضمان التحقق من picked
    if (picked != null) {
      // **[الشرط الصحيح هنا]** : الكود كله اللي بيستخدم picked بقى جواه
      setState(() {
        // تنسيق التاريخ لـ YYYY-MM-DD
        // تأكد من استخدام toLocal() لأن picked غالبًا بيكون UTC
        controller.text =
            "${picked.toLocal().year}-${picked.toLocal().month.toString().padLeft(2, '0')}-${picked.toLocal().day.toString().padLeft(2, '0')}";
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked); // تمرير كائن الـ DateTime المختار
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: widget.validator,
      readOnly:
          true, // اجعل الحقل للقراءة فقط ليختار المستخدم التاريخ من الـ picker
      onTap: () => _selectDate(context), // لفتح الـ date picker عند الضغط
      decoration: textFieldDecoration(
        // assuming textFieldDecoration is defined in text_field_style.dart
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
    );
  }
}
