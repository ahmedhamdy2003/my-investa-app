import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data'; // لإضافة Uint8List

import 'apply_screenB.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController serviceDescriptionController =
      TextEditingController();
  final TextEditingController employeesCountController =
      TextEditingController();
  final TextEditingController yearsInBusinessController =
      TextEditingController();
  final TextEditingController annualReturnController = TextEditingController();
  final TextEditingController companyWebsiteController =
      TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController businessStageController = TextEditingController();
  final TextEditingController partnersController = TextEditingController();
  final TextEditingController investmentAmountController =
      TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  final TextEditingController videoLinkController = TextEditingController();

  bool isChecked = false;
  String? gender;

  String? _pickedFileName;
  // String? _pickedFilePath; // لم نعد نستخدم هذا لـ Web
  Uint8List? _pickedFileBytes; // لتخزين بايتات الملف لـ Web
  bool _isFilePicked = false;
  bool _isPickingFile = false;

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    cityController.dispose();
    companyNameController.dispose();
    serviceDescriptionController.dispose();
    employeesCountController.dispose();
    yearsInBusinessController.dispose();
    annualReturnController.dispose();
    companyWebsiteController.dispose();
    businessTypeController.dispose();
    businessStageController.dispose();
    partnersController.dispose();
    investmentAmountController.dispose();
    projectDescriptionController.dispose();
    videoLinkController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF082347),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF082347),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF082347),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _showFileTypeSelectionSheet() async {
    if (_isPickingFile) return;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image, color: Color(0xFF082347)),
                title: const Text('Photo',
                    style: TextStyle(color: Color(0xFF082347))),
                onTap: () {
                  Navigator.pop(context);
                  _handleFilePicking(FileType.image);
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file,
                    color: Color(0xFF082347)),
                title: const Text('File',
                    style: TextStyle(color: Color(0xFF082347))),
                onTap: () {
                  Navigator.pop(context);
                  _handleFilePicking(FileType.any);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleFilePicking(FileType type) async {
    setState(() {
      _isPickingFile = true;
      _pickedFileName = null;
      _isFilePicked = false;
      // _pickedFilePath = null; // لم نعد نستخدم هذا
      _pickedFileBytes = null; // إعادة تعيين بايتات الملف
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          _pickedFileName = file.name;
          // على الويب، نستخدم `bytes` بدلاً من `path`
          _pickedFileBytes = file.bytes;
          _isFilePicked = true;
        });
        print('Selected file: ${file.name}');
        // يمكنك طباعة طول البايتات للتحقق (اختياري)
        if (file.bytes != null) {
          print('File bytes length: ${file.bytes!.length}');
        }
      } else {
        print('File picking cancelled or no file selected.');
        setState(() {
          _pickedFileName = null;
          // _pickedFilePath = null;
          _pickedFileBytes = null;
          _isFilePicked = false;
        });
      }
    } catch (e) {
      print('Error picking file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking file: $e")),
      );
      setState(() {
        _pickedFileName = null;
        // _pickedFilePath = null;
        _pickedFileBytes = null;
        _isFilePicked = false;
      });
    } finally {
      setState(() {
        _isPickingFile = false;
      });
    }
  }

  Future<void> _sendAssignData() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all required fields correctly.')),
      );
      return;
    }

    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please confirm you are not a robot.')),
      );
      return;
    }

    const String assignUrl =
        'https://2859-41-44-137-9.ngrok-free.app/insert-project/';

    // لاحظ هنا: كيفية إرسال الملف المختار إلى Django
    // على الويب، ليس لدينا "مسار" ملف تقليدي.
    // سنقوم بإرسال الملف كـ base64 String إذا كان HTTP POST عادي
    // أو كـ multipart/form-data إذا كان API يتوقع ذلك.
    // الطريقة الأسهل للتعامل معها هي إرسالها كـ multipart/form-data.

    var request = http.MultipartRequest('POST', Uri.parse(assignUrl));

    // إضافة باقي البيانات النصية
    request.fields['first_name'] = firstNameController.text;
    request.fields['last_name'] = secondNameController.text;
    request.fields['email'] = emailController.text;
    request.fields['phone_number'] = phoneController.text;
    request.fields['date_of_birth'] = dobController.text;
    request.fields['gender'] = gender ?? ''; // تأكد من التعامل مع القيمة null
    request.fields['city'] = cityController.text;
    request.fields['company_name'] = companyNameController.text;
    request.fields['service_description'] = serviceDescriptionController.text;
    request.fields['employees_count'] = employeesCountController.text;
    request.fields['years_in_business'] = yearsInBusinessController.text;
    request.fields['annual_return'] = annualReturnController.text;
    request.fields['company_website'] = companyWebsiteController.text;
    request.fields['business_type'] = businessTypeController.text;
    request.fields['business_stage'] = businessStageController.text;
    request.fields['has_partners'] = partnersController.text;
    request.fields['estimated_investment_amount'] =
        investmentAmountController.text;
    request.fields['project_description'] = projectDescriptionController.text;
    request.fields['video_link'] = videoLinkController.text;
    request.fields['is_not_robot'] = isChecked.toString();

    // إضافة الملف إذا تم اختياره
    if (_pickedFileBytes != null && _pickedFileName != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'project_image', // هذا هو اسم الحقل المتوقع في Django لملف الصورة
        _pickedFileBytes!,
        filename: _pickedFileName,
        // contentType: MediaType('image', 'jpeg'), // يمكن تحديد نوع المحتوى إذا كنت تعرفه
      ));
    }

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Assign data sent successfully: $responseBody');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data assigned successfully!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ApplyScreenB(
                firstPageData: json.decode(
                    responseBody)), // قد تحتاج لتعديل هذا ليتناسب مع استجابة Django
          ),
        );
      } else {
        print(
            'Failed to send assign data. Status code: ${response.statusCode}');
        print('Response body: $responseBody');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to assign data: $responseBody')),
        );
      }
    } catch (e) {
      print('Error sending assign data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error assigning data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF082347)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Apply',
          style: TextStyle(
            color: Color(0xFF082347),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Apply here:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A1F44),
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel('First name'),
              _buildTextField('Enter your first name',
                  controller: firstNameController),
              _buildLabel('Last name'),
              _buildTextField('Enter your second name',
                  controller: secondNameController),
              _buildLabel('Email'),
              _buildTextField('Enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress),
              _buildLabel('Phone number'),
              _buildTextField('011867809',
                  controller: phoneController,
                  keyboardType: TextInputType.phone),
              _buildLabel('Date of birth'),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                    'Select your date of birth',
                    controller: dobController,
                  ),
                ),
              ),
              _buildLabel('Gender'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: const Color(0xFF082347),
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: const Color(0xFF082347),
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              _buildLabel('City'),
              _buildTextField('Enter your city', controller: cityController),
              _buildLabel('Company Name'),
              _buildTextField('Enter your company name',
                  controller: companyNameController),
              _buildLabel('What is the service ?'),
              _buildTextField('Describe your service',
                  controller: serviceDescriptionController, maxLines: 3),
              _buildLabel('Number of company employees'),
              _buildTextField('Enter the number of employees',
                  controller: employeesCountController,
                  keyboardType: TextInputType.number),
              _buildLabel('Number of years company has been in business'),
              _buildTextField('Enter the number of years',
                  controller: yearsInBusinessController,
                  keyboardType: TextInputType.number),
              _buildLabel('Annual Return'),
              _buildTextField('Enter annual return (EGP)',
                  controller: annualReturnController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 6),
              const Text(
                '(One hundred thousand)',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF718EBF),
                ),
              ),
              const SizedBox(height: 16),
              _buildLabel('Drop your company website'),
              _buildTextField('Enter your company website',
                  controller: companyWebsiteController,
                  keyboardType: TextInputType.url),
              _buildLabel('Type of business'),
              _buildTextField('Enter type of business',
                  controller: businessTypeController),
              _buildLabel('Business Stage'),
              _buildTextField('Enter business stage',
                  controller: businessStageController),
              _buildLabel('Do you have any partners ?'),
              _buildTextField('Yes or No', controller: partnersController),
              _buildLabel(
                  'What is the estimated investment amount required from investors?'),
              _buildTextField('Enter the investment amount',
                  controller: investmentAmountController,
                  keyboardType: TextInputType.number),
              _buildLabel(
                  'Please provide a brief description of your project or product.'),
              _buildTextField('Brief description',
                  controller: projectDescriptionController, maxLines: 5),
              const SizedBox(height: 24),
              const Text(
                'Please upload an image of the project or product (.jpg)',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF082347),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                child: OutlinedButton.icon(
                  onPressed:
                      _isPickingFile ? null : _showFileTypeSelectionSheet,
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                        _isFilePicked ? const Color(0xFF082347) : Colors.grey,
                    side: BorderSide(
                        color: _isFilePicked
                            ? const Color(0xFF082347)
                            : Colors.black26),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: _isPickingFile
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF082347),
                          ),
                        )
                      : Icon(
                          _isFilePicked
                              ? Icons.check_circle
                              : Icons.attach_file,
                          color: _isFilePicked
                              ? Colors.green
                              : const Color(0xFF082347),
                          size: 20,
                        ),
                  label: Text(
                    _isPickingFile
                        ? 'Picking file...'
                        : _isFilePicked
                            ? 'Picked!'
                            : 'Choose the file',
                    style: TextStyle(
                      color:
                          _isFilePicked ? const Color(0xFF082347) : Colors.grey,
                    ),
                  ),
                ),
              ),
              if (_isFilePicked)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'File selected: $_pickedFileName',
                    style: const TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 24),
              const Text(
                'Send a recent video of you in Arabic, no longer than two minutes, that provides a strong introduction about yourself and your project idea. We want to get to know you better (your strengths). You can include a link to YouTube, Vimeo, Dropbox, etc...',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF082347),
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildTextField('Enter the link',
                  controller: videoLinkController,
                  keyboardType: TextInputType.url),
              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: const Color(0xFF082347),
                    onChanged: (val) {
                      setState(() {
                        isChecked = val!;
                      });
                    },
                  ),
                  const Text(
                    "I'm not a robot",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _sendAssignData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2640),
                    disabledBackgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Assign'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A1F44),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText,
      {TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF86878B),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }
}
