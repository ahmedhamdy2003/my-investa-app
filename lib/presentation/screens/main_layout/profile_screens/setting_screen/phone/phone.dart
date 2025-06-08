import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberUpdateScreen extends StatefulWidget {
  const PhoneNumberUpdateScreen({super.key});

  @override
  State<PhoneNumberUpdateScreen> createState() =>
      _PhoneNumberUpdateScreenState();
}

class _PhoneNumberUpdateScreenState extends State<PhoneNumberUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPhoneController = TextEditingController(text: '01015258763');
  final _newPhoneController = TextEditingController();

  bool _isUpdating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Phone Number',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Current Phone Number (Display Only)
              _buildReadOnlyField(
                label: 'Phone number',
                value: _currentPhoneController.text,
              ),

              const SizedBox(height: 24),

              // New Phone Number Field
              _buildPhoneNumberField(
                controller: _newPhoneController,
                label: 'Add a new Phone number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new phone number';
                  }
                  if (value.length < 10) {
                    return 'Phone number must be at least 10 digits';
                  }
                  if (value == _currentPhoneController.text) {
                    return 'New number must be different';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),

              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isUpdating ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001F3F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child:
                      _isUpdating
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                ),
              ),

              const Spacer(),

              // Bottom Navigation Bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF001F3F)),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: 'Enter new phone number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF001F3F)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isUpdating = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Phone number updated successfully'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        setState(() => _isUpdating = false);
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    _currentPhoneController.dispose();
    _newPhoneController.dispose();
    super.dispose();
  }
}
