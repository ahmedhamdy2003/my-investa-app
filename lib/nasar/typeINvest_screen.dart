import 'package:investa4/nasar/policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON encoding
// **[NEW]** استيراد ملف إدارة المستخدمين
import 'package:investa4/core/utils/manage_current_user.dart'; // تأكد أن المسار ده صح عندك

class TypeInvestScreen extends StatefulWidget {
  const TypeInvestScreen({super.key});

  @override
  State<TypeInvestScreen> createState() => _TypeInvestScreenState();
}

class _TypeInvestScreenState extends State<TypeInvestScreen> {
  String? _selectedInvestmentTerm;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  // Function to send data to Django backend
  Future<void> _sendDataToBackend() async {
    // 1. Validate input (optional but recommended)
    if (_selectedInvestmentTerm == null ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select an investment term and enter a description.',
          ),
        ),
      );
      return;
    }

    // **[NEW]** جلب user_id
    String? userId = ManageCurrentUser.currentUser.guid;

    // **[NEW]** التحقق لو user_id مش موجود
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffF44336),
          content: Text("Error: User ID not found. Please log in again."),
        ),
      );
      print(
        'Error: User ID is null or empty. Cannot submit investment details.',
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Submitting investment details...")),
    );

    // 2. Define your Django API endpoint URL
    // IMPORTANT: Replace with your actual Django backend URL
    const String apiUrl =
        'https://7226-197-134-76-183.ngrok-free.app/account-verificiation-2/'; // For Android emulator
    // const String apiUrl = 'http://127.0.0.1:8000/api/investments/'; // For iOS simulator or web

    // 3. Prepare the data to be sent in JSON format
    final Map<String, dynamic> data = {
      'user_id': userId, // **[NEW]** إضافة user_id
      'investment_term': _selectedInvestmentTerm,
      'description': _descriptionController.text,
      // Add any other fields you need to send to your backend
    };

    try {
      // 4. Send the POST request
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN_HERE', // أضف التوثيق إذا لزم الأمر
        },
        body: jsonEncode(data),
      );

      // 5. Handle the response
      // تم التعديل هنا: قبول كل من 201 Created و 200 OK كرمز للنجاح
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Data sent successfully
        print('Data sent successfully to Django backend!');
        print('Response body: ${response.body}');

        // Navigate to the next screen (PolicyScreen)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PolicyScreen()),
        );
      } else {
        // Error sending data for other status codes
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        // **[FIXED]** Ensure response.body is not empty before decoding
        String errorMessage;
        if (response.body.isNotEmpty) {
          try {
            final Map<String, dynamic> errorData = json.decode(response.body);
            errorMessage =
                errorData['error'] ??
                errorData['message'] ??
                'Failed to send data. Please try again.';
          } catch (e) {
            errorMessage =
                'Failed to send data. Server returned non-JSON: ${response.body}';
            print(
              'Failed to decode error JSON from server: $e, Raw body: ${response.body}',
            );
          }
        } else {
          errorMessage =
              'Server error: No response body (Status: ${response.statusCode})';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffF44336),
            content: Text(errorMessage),
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      print('Error sending data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error or an error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '9:41', // هذا النص ثابت في التصميم، يمكنك إزالته أو تغييره
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black, size: 20),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'How long do you plan to invest ?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              _buildInvestmentTermOption(
                icon: FontAwesomeIcons.faceSmile,
                label: 'Short Term',
                value: 'short_term',
                groupValue: _selectedInvestmentTerm,
                onChanged: (value) {
                  setState(() {
                    _selectedInvestmentTerm = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildInvestmentTermOption(
                icon: FontAwesomeIcons.calendar,
                label: 'Long Term',
                value: 'long_term',
                groupValue: _selectedInvestmentTerm,
                onChanged: (value) {
                  setState(() {
                    _selectedInvestmentTerm = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'Describe your purpose from\ninvesting',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 343, // عرض ثابت كما في الصورة
                height: 280, // ارتفاع ثابت كما في الصورة
                decoration: BoxDecoration(
                  color: const Color(0xFF001F3F),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null, // يسمح بعدد غير محدود من الأسطر
                  keyboardType:
                      TextInputType.multiline, // لوحة مفاتيح متعددة الأسطر
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Enter your description...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    border:
                        InputBorder.none, // إزالة حدود الـ TextField الافتراضية
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: ElevatedButton(
          onPressed: _sendDataToBackend, // Call the new function here
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff001F3F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            'Confirm',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvestmentTermOption({
    required IconData icon,
    required String label,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    bool isSelected = (value == groupValue);
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF001F3F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            FaIcon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : const Color(0xFF738395),
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child:
                  isSelected
                      ? const Center(
                        child: Icon(
                          Icons.circle,
                          color: Color(0xFF001F3F),
                          size: 12,
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
