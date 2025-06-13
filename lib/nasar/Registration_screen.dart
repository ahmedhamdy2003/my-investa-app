import 'dart:convert';

import 'package:investa4/nasar/SecurityCheck_Screen.dart';
import 'package:investa4/nasar/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';
// **[مهم]** استيراد ملف إدارة المستخدمين الذي يحتوي على ManageCurrentUser
import 'package:investa4/core/utils/manage_current_user.dart'; // تأكد أن هذا المسار صحيح تمامًا

// قائمة المحافظات المصرية
const List<String> governorates = [
  "Cairo",
  "Alexandria",
  "Giza",
  "Port Said",
  "Suez",
  "Dakahlia",
  "Red Sea",
  "Beheira",
  "Fayoum",
  "Gharbia",
  "Ismailia",
  "Menoufia",
  "Minya",
  "Qaliubiya",
  "New Valley",
  "North Sinai",
  "Aswan",
  "Assiut",
  "Beni Suef",
  "South Sinai",
  "Sharqia",
  "Sohag",
  "Qena",
  "Matrouh",
  "Luxor",
  "Kafr El Sheikh",
  "Damietta",
];

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final nationalNumberController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdateController = TextEditingController();
  final countryController = TextEditingController();
  final postalCodeController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    nationalNumberController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    countryController.dispose();
    postalCodeController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext ctx) async {
    final picked = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder:
          (_, child) => Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff082347),
                onPrimary: Colors.white,
                onSurface: Color(0xff082347),
              ),
            ),
            child: child!,
          ),
    );
    if (picked != null) {
      birthdateController.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  Future<void> _pickLocation() async {
    final String? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapPickerScreen()),
    );
    if (result != null) {
      setState(() {
        address2Controller.text = result;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Show loading screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoadingScreen()),
      );

      // **[هنا يتم جلب user_id]**
      String? userId = ManageCurrentUser.currentUser.guid;

      // **[تحقق من وجود user_id]**
      if (userId.isEmpty) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context); // Pop loading screen
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffF44336),
            content: Text("Error: User ID not found. Please log in again."),
          ),
        );
        print(
          'Error: User ID is null or empty. Cannot proceed with registration.',
        );
        return; // Stop the submission process
      }

      // Prepare data for API
      final Map<String, dynamic> registrationData = {
        'user_id': userId, // **[تم إضافة user_id هنا]**
        'full_name': fullNameController.text,
        'national_number': nationalNumberController.text,
        'phone_number': phoneController.text,
        'birthdate': birthdateController.text,
        'country': countryController.text,
        'postal_code': postalCodeController.text,
        'address_1': address1Controller.text,
        'address_2': address2Controller.text,
      };

      const String apiUrl =
          'https://54c2-154-238-249-140.ngrok-free.app/personal-data/';
      try {
        final http.Response response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(registrationData),
        );

        // Pop the loading screen
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        if (response.statusCode == 201 || response.statusCode == 200) {
          // Registration successful
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xff4CAF50), // Green for success
              content: Text("Registration successful!"),
            ),
          );
          // Navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SecurityCheckScreen()),
          );
        } else {
          // Registration failed
          final Map<String, dynamic> errorData = json.decode(response.body);
          String errorMessage =
              errorData['error'] ??
              errorData['message'] ??
              'Registration failed. Please try again.';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xffF44336), // Red for error
              content: Text("Error: $errorMessage"),
            ),
          );
          print(
            'Failed to register: ${response.statusCode} - ${response.body}',
          );
        }
      } catch (e) {
        // Pop the loading screen in case of an error
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xffF44336), // Red for error
            content: Text("Network error: Could not connect to the server."),
          ),
        );
        print('Error during registration: $e');
      }
    }
  }

  void _showGovernoratesBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (_) => Container(
            height: 400,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Choose your Governorate",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: governorates.length,
                    itemBuilder:
                        (_, i) => ListTile(
                          title: Text(
                            governorates[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff001F3F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            countryController.text = governorates[i];
                            Navigator.pop(context);
                          },
                        ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text("Back", style: TextStyle(color: Color(0xff001F3F))),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle skip action if needed
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Color(0xff001F3F)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                fullNameController,
                "Full Name as in the National ID",
                "Enter full name",
                isName: true,
              ),
              _buildTextField(
                nationalNumberController,
                "National Number",
                "Enter national number",
                isNationalNumber: true,
              ),
              _buildTextField(
                phoneController,
                "Phone Number",
                "Enter phone number",
                isPhoneNumber: true,
              ),
              _buildDatePickerField(),
              Row(
                children: [
                  Expanded(child: Text("Country", style: _labelStyle)),
                  const SizedBox(width: 10),
                  Expanded(child: Text("Postal Code", style: _labelStyle)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _showGovernoratesBottomSheet,
                      child: AbsorbPointer(
                        child: _buildTextField(
                          countryController,
                          "",
                          "Select Governorate",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      postalCodeController,
                      "",
                      "5-digits",
                      isPostalCode: true,
                    ),
                  ),
                ],
              ),
              _buildTextField(
                address1Controller,
                "Physical Address 1",
                "Full address",
              ),
              _buildLocationPickerField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff001F3F),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _labelStyle =>
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87);

  Widget _buildTextField(
    TextEditingController ctrl,
    String label,
    String hint, {
    bool isName = false,
    bool isNationalNumber = false,
    bool isPhoneNumber = false,
    bool isPostalCode = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty) Text(label, style: _labelStyle),
          const SizedBox(height: 5),
          TextFormField(
            controller: ctrl,
            validator: (v) {
              if (v == null || v.isEmpty) return "Required";
              // Removed filtering for name here, relying only on validator
              if (isName &&
                  !RegExp(
                    r'^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+$',
                  ).hasMatch(v)) {
                return "Only Arabic and English letters allowed";
              }
              if (isNationalNumber &&
                  (v.length != 14 || !RegExp(r'^[0-9]+$').hasMatch(v))) {
                return "Must be 14 digits";
              }
              if (isPhoneNumber && !RegExp(r'^[0-9]+$').hasMatch(v)) {
                return "Only numbers allowed";
              }
              if (isPostalCode &&
                  (v.length != 5 || !RegExp(r'^[0-9]+$').hasMatch(v))) {
                return "Must be 5 digits";
              }
              return null;
            },
            inputFormatters: [
              // Removed the problematic FilteringTextInputFormatter for isName
              if (isNationalNumber || isPhoneNumber || isPostalCode)
                FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType:
                isNationalNumber || isPhoneNumber || isPostalCode
                    ? TextInputType.number
                    : TextInputType.text, // Explicitly set keyboard type
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              counterText: "",
            ),
            maxLength:
                isPostalCode
                    ? 5
                    : isNationalNumber
                    ? 14
                    : null,
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Birthdate", style: _labelStyle),
          const SizedBox(height: 5),
          TextFormField(
            controller: birthdateController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Select birthdate",
              suffixIcon: const Icon(
                Icons.calendar_today,
                color: Color(0xff082347),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onTap: () => _selectDate(context),
            validator: (v) => v == null || v.isEmpty ? "Required" : null,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationPickerField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Physical Address 2", style: _labelStyle),
          const SizedBox(height: 5),
          TextFormField(
            controller: address2Controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Tap to add on map",
              suffixIcon: IconButton(
                icon: const Icon(Icons.location_pin, color: Color(0xff082347)),
                onPressed: _pickLocation,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator:
                (v) =>
                    v == null || v.isEmpty ? "Please select a location" : null,
          ),
        ],
      ),
    );
  }
}

/// شاشة اختيار الموقع
class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  _MapPickerScreenState createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // comes in).
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    try {
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = LatLng(pos.latitude, pos.longitude);
      });
    } catch (e) {
      print("Location error: $e");
      // You might want to show a SnackBar or an alert here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not get current location: $e')),
      );
    }
  }

  /// جلب العنوان من OSM Nominatim
  Future<String?> _reverseGeocode(LatLng pos) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${pos.latitude}&lon=${pos.longitude}';
    try {
      final res = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'flutter_app', // مطلوب حسب سياسة Nominatim
        },
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        if (data['display_name'] != null) {
          return data['display_name'] as String;
        }
      } else {
        print('OSM reverse geocode failed: ${res.statusCode}');
      }
    } catch (e) {
      print('Error in OSM geocode: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Location"),
        backgroundColor: const Color(0xff001F3F),
      ),
      body:
          _currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      center: _currentPosition,
                      zoom: 16,
                      onTap: (_, latlng) {
                        setState(() => _currentPosition = latlng);
                      },
                    ),
                    children: [
                      // This uses OpenStreetMap tiles and a client-side API for reverse geocoding
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'com.example.your_app_name',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _currentPosition!,
                            width: 50,
                            height: 50,
                            builder:
                                (_) => const Icon(
                                  Icons.location_pin,
                                  size: 50,
                                  color: Colors.redAccent,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_currentPosition == null) return;
                        final text = await _reverseGeocode(_currentPosition!);
                        final result =
                            text ??
                            "Lat: ${_currentPosition!.latitude.toStringAsFixed(6)}, Lng: ${_currentPosition!.longitude.toStringAsFixed(6)}";
                        Navigator.pop(ctx, result);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff001F3F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Confirm Location",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
