import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:first_page/phaseThree_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // اللوجو على الشمال
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/logo (3).png',
                    width: 123,
                    height: 91,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // البوكس الأبيض الرئيسي
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi Norhan Salah ,\n'
                        'After submitting & accepting your project, zerosugar by ketonista, through our platform. and after reviewing and evaluating your data using our AI and analysis team and accepting it , here are the most important and critical to prove the Legal validity of the brand.',
                        style: TextStyle(
                            fontSize: 14, height: 1.6, color: Colors.black87),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '🔒 Documents required to prove the existence of the project:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Commercial register (if available).\n'
                        '• Tax card.\n'
                        '• Operating license (for shops and projects with an actual location).\n'
                        '• Lease or ownership contract for the project location (shop, workshop, kitchen, or designated residential space).\n'
                        '• A photo of a dedicated bank account for the project (optional but preferred).\n'
                        '• Recent photos showing the project’s activity and its location.',
                        style: TextStyle(fontSize: 14, height: 1.6),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Check the pdf below to prepare the Legal Requirements',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Here are the pdf :',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: _pickFile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00194A),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'drag the file',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      if (_selectedFile != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          'Selected file: ${_selectedFile!.path.split('/').last}',
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),
                      const Text(
                        'This email was sent to\nNorhansalah.zketonista@gmail.com.\n'
                        'We are excited to work with you,\nhelp you grow, and attract the right investors for you.\n'
                        'If you have any inquiries or need support in preparing your files,\nplease don\'t hesitate to contact us.\n\nBest regards,\nInvesta – Support Team',
                        style: TextStyle(
                            fontSize: 13, color: Colors.black87, height: 1.6),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/investa.png',
                            width: 88,
                            height: 42,
                          ),
                          const Spacer(),
                          const Icon(FontAwesomeIcons.facebookF,
                              color: Color(0xff082347), size: 20),
                          const SizedBox(width: 12),
                          const Icon(FontAwesomeIcons.twitter,
                              color: Color(0xff082347), size: 20),
                          const SizedBox(width: 12),
                          const Icon(FontAwesomeIcons.linkedin,
                              color: Color(0xff082347), size: 20),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // زر الرجوع والسهم
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFF082347),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF082347),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const phaseThree_screen(), // تم التوجيه للصفحة الجديدة
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
