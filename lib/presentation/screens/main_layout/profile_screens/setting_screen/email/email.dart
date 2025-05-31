// import 'package:flutter/material.dart';
//
// class EmailUpdateScreen extends StatefulWidget {
//   const EmailUpdateScreen({super.key});
//
//   @override
//   _EmailUpdateScreenState createState() => _EmailUpdateScreenState();
// }
//
// class _EmailUpdateScreenState extends State<EmailUpdateScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final String _currentEmail = "Younismahmoud_23a4@gmail.com";
//   String _newEmail = "";
//   String _password = "";
//   bool _obscurePassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Update Email"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Current Email", style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Text(_currentEmail, style: TextStyle(fontSize: 16)),
//               SizedBox(height: 20),
//
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "New Email",
//                   border: OutlineInputBorder(),
//                   hintText: "User@gmail.com",
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a new email';
//                   }
//                   if (!value.contains('@')) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _newEmail = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Current Password",
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: _obscurePassword,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _password = value;
//                   });
//                 },
//               ),
//
//               SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Perform update logic here
//                       _updateEmail();
//                     }
//                   },
//                   child: Text("Update"),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _updateEmail() {
//     // Implement your email update logic here
//     print("Updating email to $_newEmail");
//   }
// }
//

import 'package:flutter/material.dart';

class EmailUpdateForm extends StatefulWidget {
  const EmailUpdateForm({super.key});

  @override
  _EmailUpdateFormState createState() => _EmailUpdateFormState();
}

class _EmailUpdateFormState extends State<EmailUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _newEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: Color(0xFF001F3F), // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('ُEmail', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              // Current Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: ' Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // هنا أضفنا Radius
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),


              SizedBox(height: 30),

              // New Email Field
              TextFormField(
                controller: _newEmailController,
                decoration: InputDecoration(
                  labelText: 'New Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  if (value == _emailController.text) {
                    return 'New email must be different';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              SizedBox(height: 70),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _updateEmail();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Color(0xFF001F3F), // لون الخلفية
                  foregroundColor: Colors.white, // لون النص
                ),
                child: const Text('Update'),
              )

            ],
          ),
        ),
      ),
    );
  }

  void _updateEmail() {
    // Implement your update logic here
    final email = _emailController.text;
    final newEmail = _newEmailController.text;
    final password = _passwordController.text;

    print('Updating from $email to $newEmail with password $password');
    // Add your API call or database update here
  }
}