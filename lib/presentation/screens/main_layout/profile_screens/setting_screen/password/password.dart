// import 'package:flutter/material.dart';
//
// class PasswordUpdateScreen extends StatefulWidget {
//   @override
//   _PasswordUpdateScreenState createState() => _PasswordUpdateScreenState();
// }
//
// class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isUpdating = false;
//   bool _obscureCurrentPassword = true;
//   bool _obscureNewPassword = true;
//   bool _obscureReEnterPassword = true;
//
//   final TextEditingController _currentPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _reEnterPasswordController = TextEditingController();
//
//   int _currentIndex = 2; // Dashboard is active
//
//   @override
//   void dispose() {
//     _currentPasswordController.dispose();
//     _newPasswordController.dispose();
//     _reEnterPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Password'),
//         centerTitle: false,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 const SizedBox(height: 32),
//                 _buildPasswordField(
//                   controller: _currentPasswordController,
//                   label: 'Current Password',
//                   obscure: _obscureCurrentPassword,
//                   onToggle: () => setState(() => _obscureCurrentPassword = !_obscureCurrentPassword),
//                 ),
//                 const SizedBox(height: 24),
//                 _buildPasswordField(
//                   controller: _newPasswordController,
//                   label: 'New Password',
//                   obscure: _obscureNewPassword,
//                   onToggle: () => setState(() => _obscureNewPassword = !_obscureNewPassword),
//                 ),
//                 const SizedBox(height: 24),
//                 _buildPasswordField(
//                   controller: _reEnterPasswordController,
//                   label: 'Re-Enter New Password',
//                   obscure: _obscureReEnterPassword,
//                   onToggle: () => setState(() => _obscureReEnterPassword = !_obscureReEnterPassword),
//                 ),
//                 const SizedBox(height: 40),
//                 _buildUpdateButton(),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }
//
//   Widget _buildPasswordField({
//     required TextEditingController controller,
//     required String label,
//     required bool obscure,
//     required VoidCallback onToggle,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscure,
//       decoration: InputDecoration(
//         labelText: label,
//         border: const UnderlineInputBorder(),
//         suffixIcon: TextButton(
//           onPressed: onToggle,
//           child: Text(
//             obscure ? 'Show' : 'Hide',
//             style: const TextStyle(color: Colors.blue),
//           ),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your $label';
//         }
//         if (value.length < 6) {
//           return 'Password must be at least 6 characters';
//         }
//         if (label.contains('Re-Enter') && value != _newPasswordController.text) {
//           return 'Passwords do not match';
//         }
//         if (label == 'New Password' && value == _currentPasswordController.text) {
//           return 'New password must be different';
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget _buildUpdateButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _isUpdating ? null : _handleUpdate,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: _isUpdating
//               ? const SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               color: Colors.white,
//             ),
//           )
//               : const Text('Update'),
//         ),
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
//
//   BottomNavigationBar _buildBottomNavBar() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: _handleNavigation,
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
//         BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Reels'),
//         BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
//
//   Future<void> _handleUpdate() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() => _isUpdating = true);
//
//     try {
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Password updated successfully!'),
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//
//       // Clear form after success
//       _formKey.currentState!.reset();
//       setState(() {
//         _obscureCurrentPassword = true;
//         _obscureNewPassword = true;
//         _obscureReEnterPassword = true;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() => _isUpdating = false);
//     }
//   }
//
//   void _handleNavigation(int index) {
//     setState(() => _currentIndex = index);
//     // Add actual navigation logic here
//   }
// }

import 'package:flutter/material.dart';

class PasswordChangeScreen extends StatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Password', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Current Password Field
                _buildPasswordField(
                  controller: _currentPasswordController,
                  label: 'Current Password',
                  obscureText: _obscureCurrentPassword,
                  onToggleVisibility:
                      () => setState(() {
                        _obscureCurrentPassword = !_obscureCurrentPassword;
                      }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // New Password Field
                _buildPasswordField(
                  controller: _newPasswordController,
                  label: 'New Password',
                  obscureText: _obscureNewPassword,
                  onToggleVisibility:
                      () => setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (value == _currentPasswordController.text) {
                      return 'New password must be different';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Confirm New Password Field
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  label: 'Re-Enter New Password',
                  obscureText: _obscureConfirmPassword,
                  onToggleVisibility:
                      () => setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                // Update Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF001F3F),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
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
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
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
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: '•' * 8,
            hintStyle: const TextStyle(letterSpacing: 2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility,
            ),
          ),
          style: const TextStyle(letterSpacing: 1.5),
          validator: validator,
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle password update logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
