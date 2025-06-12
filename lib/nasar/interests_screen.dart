// lib/nasar/interests_screen.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // **[NEW]** لحفظ flags

import 'package:investa4/nasar/welcome_screen.dart';
// **[NEW]** استيراد ملف إدارة المستخدمين
import 'package:investa4/core/utils/manage_current_user.dart'
    as current_user; // باستخدام alias
// **[NEW]** استيراد شاشة Home النهائية للمستثمر
import 'package:investa4/nasar/home_screen.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> imagePaths = [
    'assets/Fashion (2).png',
    'assets/Health & Fitness.png',
    'assets/Food Truck (2).png',
    'assets/Beauty (2).png',
    'assets/Food & Beverage.png',
    'assets/Food & Beverage.png',
  ];

  List<String> interestLabels = [
    'Fashion',
    'Health & Fitness',
    'Food Truck',
    'Beauty',
    'Food & Beverage 1',
    'Food & Beverage 2',
  ];

  Set<int> selectedIndices = {};
  bool _isLoading = false;
  String _errorMessage = '';

  // **مهم:** Base URL بتاع الباك إند بتاعك.
  // لازم تغير هذا الرابط بالـ URL الفعلي لـ ngrok الحالي.
  static const String _baseUrl =
      'https://7226-197-134-76-183.ngrok-free.app/'; // **[MODIFIED]** تأكد أن هذا الـ URL محدّث وفعّال

  // دالة إرسال الاهتمامات للباك إند
  Future<void> _sendInterestsToBackend() async {
    // **[FIXED]** فحص mounted في بداية الدالة
    if (!mounted) return;

    if (selectedIndices.isEmpty) {
      if (mounted) {
        // **[FIXED]** فحص mounted
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one interest.')),
        );
      }
      return;
    }

    // **[NEW]** جلب user_id
    String? userId = current_user.ManageCurrentUser.currentUser?.guid;
    // **[FIXED]** تأكد من التحقق من user_id بشكل صحيح (null أو empty)
    if (userId == null || userId.isEmpty) {
      if (mounted) {
        // **[FIXED]** فحص mounted
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffF44336),
            content: Text("Error: User ID not found. Please log in again."),
          ),
        );
      }
      print('Error: User ID is null or empty. Cannot submit interests.');
      return;
    }

    if (mounted) {
      // **[FIXED]** فحص mounted
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });
    }

    List<String> selectedInterests =
        selectedIndices.map((index) => interestLabels[index]).toList();

    // **[MODIFIED]** تجهيز البيانات لإرسالها، بما في ذلك user_id في الـ Body
    final Map<String, dynamic> dataToSend = {
      'user_id': userId, // **[NEW]** إضافة user_id في الـ Body
      'interests': selectedInterests,
    };

    try {
      print(
        'Sending interests data to backend: ${jsonEncode(dataToSend)}',
      ); // [DEBUGGING]

      final response = await http.post(
        Uri.parse('${_baseUrl}interests/'), // ده API إرسال الاهتمامات
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user_id':
              userId, // **[NEW]** أضف user_id للـ headers هنا كمان (لو الـ Backend بيطلبه في الـ headers)
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN', // لو محتاج توكن للاستيثاق
        },
        body: jsonEncode(
          dataToSend,
        ), // إرسال الـ Map الكاملة مع user_id في الـ Body
      );

      print('API Response Status Code: ${response.statusCode}'); // [DEBUGGING]
      print('API Response Body: ${response.body}'); // [DEBUGGING]

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Interests sent successfully to Django backend!');

        // **[NEW LOGIC]** بما أن InterestsScreen هي آخر خطوة لـ Investor Setup،
        // نسجل is_initial_setup_complete هنا
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('is_initial_setup_complete', true); // **[NEW]**

        if (mounted) {
          // **[FIXED]** فحص mounted
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xff4CAF50),
              content: Text("Interests saved successfully!"),
            ),
          );
          // الانتقال لـ HomeScreen (شاشة Investor Home)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } else {
        String errorMessage;
        if (response.body.isNotEmpty) {
          try {
            final Map<String, dynamic> errorData = json.decode(response.body);
            errorMessage =
                errorData['error'] ??
                errorData['message'] ??
                'Failed to save interests. Please try again.';
          } catch (e) {
            errorMessage =
                'Failed to save interests. Server returned non-JSON: ${response.body}';
            print(
              'Failed to decode error JSON from server: $e, Raw body: ${response.body}',
            );
          }
        } else {
          errorMessage =
              'Server error: No response body (Status: ${response.statusCode})';
        }
        if (mounted) {
          // **[FIXED]** فحص mounted
          setState(() {
            _errorMessage = errorMessage;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xffF44336),
              content: Text(errorMessage),
            ),
          );
        }
        print(
          'Failed to send interests: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      if (mounted) {
        // **[FIXED]** فحص mounted
        setState(() {
          _errorMessage = 'An error occurred: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xffF44336),
            content: Text('Network error: $e'),
          ),
        );
      }
      print('Error sending interests: $e');
    } finally {
      if (mounted) {
        // **[FIXED]** فحص mounted
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Choose your Interests',
          style: TextStyle(
            color: Color(0xff001F3F),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF082347)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // (الفقاقيع Bubble images)
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/bubble 2.png',
              width: 270,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/bubble.png', width: 230),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Image.asset(
              'assets/bubble 3.png',
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              const SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "What’s your interest?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff001F3F),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(imagePaths.length, (index) {
                    bool isSelected = selectedIndices.contains(index);
                    return GestureDetector(
                      onTap: () {
                        if (mounted) {
                          // **[FIXED]** فحص mounted
                          setState(() {
                            if (isSelected) {
                              selectedIndices.remove(index);
                            } else {
                              selectedIndices.add(index);
                            }
                          });
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                isSelected
                                    ? const Color(0xff001F3F)
                                    : const Color(0xffD9E4FF),
                            width: isSelected ? 1 : 2,
                          ),
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: const Color(
                                        0xff001F3F,
                                      ).withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                  : [],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    if (_isLoading)
                      const CircularProgressIndicator(color: Color(0xff001F3F)),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _sendInterestsToBackend,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff001F3F),
                        padding: EdgeInsets.zero,
                        fixedSize: const Size(164, 61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        if (mounted) {
                          // **[FIXED]** فحص mounted
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomeScreen(),
                            ), // للتأكد من ان المستخدم بيختار دوره صح
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff001F3F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
