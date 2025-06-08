import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:investa4/nasar/phaseTwo_screenF.dart'; // تأكد من المسار الصحيح

class PhaseTwoScreenE extends StatefulWidget {
  // 1. إضافة projectId كـ parameter مطلوب في constructor
  final String projectId;
  final Map<String, dynamic> allCollectedData;

  // 2. تحديث الـ constructor ليطلب projectId
  const PhaseTwoScreenE({
    super.key,
    required this.allCollectedData,
    required this.projectId,
  });

  @override
  State<PhaseTwoScreenE> createState() => _PhaseTwoScreenEState();
}

class _PhaseTwoScreenEState extends State<PhaseTwoScreenE> {
  final TextEditingController _commercialRegController =
      TextEditingController();
  final TextEditingController _financialSummaryController =
      TextEditingController();
  final TextEditingController _businessPlanController = TextEditingController();

  PlatformFile? _commercialRegFile;
  PlatformFile? _financialSummaryFile;
  PlatformFile? _businessPlanFile;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _commercialRegController.text =
        widget.allCollectedData['commercialRegFileName'] ?? '';
    _financialSummaryController.text =
        widget.allCollectedData['financialSummaryFileName'] ?? '';
    _businessPlanController.text =
        widget.allCollectedData['simplifiedBusinessPlanFileName'] ?? '';

    if (widget.allCollectedData['commercialRegFile'] is PlatformFile) {
      _commercialRegFile = widget.allCollectedData['commercialRegFile'];
      _commercialRegController.text = _commercialRegFile!.name;
    }
    if (widget.allCollectedData['financialSummaryFile'] is PlatformFile) {
      _financialSummaryFile = widget.allCollectedData['financialSummaryFile'];
      _financialSummaryController.text = _financialSummaryFile!.name;
    }
    if (widget.allCollectedData['businessPlanFile'] is PlatformFile) {
      _businessPlanFile = widget.allCollectedData['businessPlanFile'];
      _businessPlanController.text = _businessPlanFile!.name;
    }
  }

  @override
  void dispose() {
    _commercialRegController.dispose();
    _financialSummaryController.dispose();
    _businessPlanController.dispose();
    super.dispose();
  }

  Future<void> _pickFile(
    TextEditingController controller,
    String fileType,
  ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      withData: true,
    );

    if (result != null) {
      setState(() {
        final pickedFile = result.files.single;
        controller.text = pickedFile.name;

        if (fileType == 'commercialReg') {
          _commercialRegFile = pickedFile;
        } else if (fileType == 'financialSummary') {
          _financialSummaryFile = pickedFile;
        } else if (fileType == 'businessPlan') {
          _businessPlanFile = pickedFile;
        }
      });
      print(
        'File picked: ${result.files.single.name}, Bytes available: ${result.files.single.bytes != null}',
      );
    } else {
      print('User cancelled the file picking.');
    }
  }

  Future<void> _submitAllData() async {
    setState(() {
      _isLoading = true;
    });

    Map<String, dynamic> currentScreenData = {};

    final Map<String, dynamic> finalDataForFields = {};
    widget.allCollectedData.forEach((key, value) {
      if (value is! PlatformFile && value is! List<PlatformFile>) {
        finalDataForFields[key] = value;
      }
    });
    currentScreenData.forEach((key, value) {
      if (value is! PlatformFile && value is! List<PlatformFile>) {
        finalDataForFields[key] = value;
      }
    });

    // 3. إضافة projectId إلى البيانات المرسلة
    finalDataForFields['projectId'] = widget.projectId;

    print('All collected data for text fields submission:');
    finalDataForFields.forEach((key, value) {
      print('$key: $value');
    });

    const String url =
        'https://2859-41-44-137-9.ngrok-free.app/create-project/'; // <--- مهم جداً: تأكد من تحديث هذا الرابط بالرابط الجديد من ngrok
    // (مثال: 'https://abcd-1234-efgh-5678.ngrok-free.app/create-project/')

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      finalDataForFields.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      if (widget.allCollectedData['projectLogoFile'] is PlatformFile &&
          (widget.allCollectedData['projectLogoFile'] as PlatformFile).bytes !=
              null) {
        final PlatformFile logoFile =
            widget.allCollectedData['projectLogoFile'];
        request.files.add(
          http.MultipartFile.fromBytes(
            'project_logo',
            logoFile.bytes!,
            filename: logoFile.name,
            contentType: MediaType('image', logoFile.extension ?? 'jpeg'),
          ),
        );
      }

      if (widget.allCollectedData['pickedMediaFiles'] is List<PlatformFile>) {
        final List<PlatformFile> mediaFiles =
            widget.allCollectedData['pickedMediaFiles'];
        for (int i = 0; i < mediaFiles.length; i++) {
          final PlatformFile mediaFile = mediaFiles[i];
          if (mediaFile.bytes != null) {
            request.files.add(
              http.MultipartFile.fromBytes(
                'media_files',
                mediaFile.bytes!,
                filename: mediaFile.name,
                contentType: MediaType(
                  'application',
                  mediaFile.extension ?? 'octet-stream',
                ),
              ),
            );
          }
        }
      }

      if (_commercialRegFile != null && _commercialRegFile!.bytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'commercialRegFile',
            _commercialRegFile!.bytes!,
            filename: _commercialRegFile!.name,
            contentType: MediaType(
              'application',
              _commercialRegFile!.extension ?? 'pdf',
            ),
          ),
        );
      }
      if (_financialSummaryFile != null &&
          _financialSummaryFile!.bytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'financialSummaryFile',
            _financialSummaryFile!.bytes!,
            filename: _financialSummaryFile!.name,
            contentType: MediaType(
              'application',
              _financialSummaryFile!.extension ?? 'pdf',
            ),
          ),
        );
      }
      if (_businessPlanFile != null && _businessPlanFile!.bytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'simplifiedBusinessPlanFile',
            _businessPlanFile!.bytes!,
            filename: _businessPlanFile!.name,
            contentType: MediaType(
              'application',
              _businessPlanFile!.extension ?? 'pdf',
            ),
          ),
        );
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('All project data submitted successfully!');
        print('Response: ${response.body}');

        String? receivedProjectId;
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          receivedProjectId =
              responseData['projectId']
                  as String?; // تأكد إن المفتاح اسمه 'projectId'
          print(
            'Received Project ID from backend: $receivedProjectId',
          ); // <-- للتحقق في الـ Console
        } catch (e) {
          print('Error parsing project ID from response: $e');
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('All data submitted successfully!')),
          );
          // الانتقال لصفحة PhaseTwoScreenF وتمرير الـ projectId
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => PhaseTwoScreenF(
                    projectId:
                        receivedProjectId ??
                        'fallback_id_if_null', // <--- أهم تغيير: تمرير الـ ID المستلم أو قيمة احتياطية
                  ),
            ),
          );
        }
      } else {
        print(
          'Failed to submit all project data. Status code: ${response.statusCode}',
        );
        print('Response body: ${response.body}');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to submit data: ${response.statusCode} - ${response.body}',
              ),
            ),
          );
        }
      }
    } catch (e) {
      print('Error submitting all project data: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error submitting data: $e')));
      }
    } finally {
      if (mounted) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Attachments (recommended):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF082347),
                ),
              ),
              _buildLabel(
                '• Commercial Registration or Legal Proof of the Project',
              ),
              _buildTextFieldWithAttachment(
                _commercialRegController,
                'Upload file or type here',
                () => _pickFile(
                  _commercialRegController,
                  'commercialReg',
                ), // Pass file type
              ),
              _buildLabel('• Financial Performance Summary (Excel or PDF)'),
              _buildTextFieldWithAttachment(
                _financialSummaryController,
                'Upload file or type here',
                () => _pickFile(
                  _financialSummaryController,
                  'financialSummary',
                ), // Pass file type
              ),
              _buildLabel('• Simplified Business Plan'),
              _buildTextFieldWithAttachment(
                _businessPlanController,
                'Upload file or type here',
                () => _pickFile(
                  _businessPlanController,
                  'businessPlan',
                ), // Pass file type
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  SizedBox(
                    width: 368,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitAllData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF082347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : const Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Color(0xFF082347), fontSize: 24),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF082347),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithAttachment(
    TextEditingController controller,
    String hint,
    VoidCallback onAttachmentPressed,
  ) {
    return Container(
      width: 328,
      height: 44,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: onAttachmentPressed,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF082347)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF082347), width: 2),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.attach_file, color: Color(0xFF082347)),
            onPressed: onAttachmentPressed,
          ),
        ),
      ),
    );
  }
}
