import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investa4/core/utils/global_variables.dart';
import 'package:investa4/featurs/founder/founder_dash/presentation/founder_dashboard.dart';
import 'chat_bot_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// استيراد الشاشات الفرعية اللي هتفتح من BottomNavigationBar
import 'package:investa4/nasar/founder_community.dart';
import 'package:investa4/nasar/founder_reels.dart';
import 'package:investa4/nasar/founder_profile.dart';

class FounderHomeScreen extends StatefulWidget {
  final String projectId;
  // 1. أضف خاصية userId هنا
  final String? userId; // <--- هنا تم إضافة الـ userId

  const FounderHomeScreen({
    super.key,
    required this.projectId,
    this.userId,
  }); // <--- هنا تم استقبال الـ userId

  @override
  State<FounderHomeScreen> createState() => _FounderHomeScreenState();
}

class _FounderHomeScreenState extends State<FounderHomeScreen> {
  final Color textColor = const Color(0xFF082347);

  String _userName = "Guest";
  String _userProfilePicUrl = 'assets/fakhr.png';
  String _projectStatus = "Loading...";
  String _progressPercentage = "Loading...";
  String _numInvestors = "Loading...";
  String _totalFunding = "Loading...";
  String _overallProjectRating = "Loading...";

  String? _successRate;
  String? _failureRate;

  bool _isLoading = true;
  String _errorMessage = "";
  int _selectedIndex = 0; // 0 for Home tab

  @override
  void initState() {
    super.initState();
    // جلب البيانات عند فتح الشاشة الرئيسية
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFounderData();
      _calculatePrediction();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _fetchFounderData() async {
    // setState(() {
    _isLoading = true;
    _errorMessage = "";
    // });

    // يمكنك استخدام widget.userId هنا إذا كان الـ API يحتاجه
    // مثال: final String apiUrl = 'https://2859-41-44-137-9.ngrok-free.app/founder-home/${widget.projectId}?userId=${widget.userId ?? ''}';
    final String apiUrl = '$baseUrl/founder-home/${widget.projectId}';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          _userName = data['user_data']['name'] ?? "Guest";
          _userProfilePicUrl =
              data['user_data']['profile_picture'] ?? 'assets/fakhr.png';

          _projectStatus = data['overview_data']['project_status'] ?? "N/A";
          _progressPercentage =
              data['overview_data']['progress_percentage'] ?? "N/A";
          _numInvestors =
              data['overview_data']['num_investors']?.toString() ?? "N/A";
          _totalFunding = data['overview_data']['total_funding'] ?? "N/A";
          _overallProjectRating =
              data['overview_data']['overall_project_rating'] ?? "N/A";

          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data: ${response.statusCode}';
          _isLoading = false;
        });
        print('Failed to load founder data: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _isLoading = false;
      });
      print('Error fetching founder data: $e');
    }
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          ),
          Text(value, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 20, thickness: 1);
  }

  void _calculatePrediction() {
    setState(() {
      _successRate = '75%';
      _failureRate = '25%';
    });
  }

  void _showChatBotModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: const ChatBotView(),
          ),
        );
      },
    );
  }

  // **[هذه هي الدالة التي تبني محتوى صفحة الـ Home الرئيسية للـ Founder]**
  // هذا المحتوى هو ما سيظهر عندما يكون _selectedIndex = 0
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(34.5),
                child:
                    _userProfilePicUrl.startsWith('http')
                        ? Image.network(
                          _userProfilePicUrl,
                          width: 69,
                          height: 69,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Image.asset(
                                'assets/fakhr.png',
                                width: 69,
                                height: 69,
                                fit: BoxFit.cover,
                              ),
                        )
                        : Image.asset(
                          _userProfilePicUrl,
                          width: 69,
                          height: 69,
                          fit: BoxFit.cover,
                        ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome, $_userName ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Continue to Achieve your Goals",
                      style: TextStyle(fontSize: 14, color: textColor),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.notifications_none,
                color: Color(0xFF082347),
                size: 24,
              ),
            ],
          ),
          // [DEBUG] لعرض الـ userId للتأكد من وصوله
          if (widget.userId != null && widget.userId!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "User ID: ${widget.userId}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          // [DEBUG] لعرض الـ projectId للتأكد من وصوله
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Project ID: ${widget.projectId}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Quick Overview :",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow("Project Status", _projectStatus),
          _buildDivider(),
          _buildInfoRow("Progress Percentage", _progressPercentage),
          _buildDivider(),
          _buildInfoRow("Number of investors", _numInvestors),
          _buildDivider(),
          _buildInfoRow("Total Funding", _totalFunding),
          _buildDivider(),
          _buildInfoRow("Overall Project Rating", _overallProjectRating),
          _buildDivider(),
          Text(
            "AI prediction for future success",
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/fail.png',
                    width: 90,
                    height: 166,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _failureRate ?? '-%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/suc.png',
                    width: 90,
                    height: 166,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _successRate ?? '-%',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _calculatePrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  shape: const CircleBorder(),
                  minimumSize: const Size(60, 60),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF434343),
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      left: 12,
                      child: Transform.rotate(
                        angle: 45 * 3.1415926535 / 180,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: const Color(0xFF42A5F5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      child: Container(
                        width: 28,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xffD3D3D3),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                            bottom: Radius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 2,
                      top: 8,
                      child: Container(
                        width: 4,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xffD3D3D3),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(2),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 2,
                      top: 8,
                      child: Container(
                        width: 4,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xffD3D3D3),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildDivider(),
          Text(
            "Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          _buildInfoRow("Funding Goal", "500,000 L.E – 850,000 L.E"),
          _buildDivider(),
          _buildInfoRow("Completed Funding", "0 L.E"),
          _buildDivider(),
          _buildInfoRow("Expected Success Rate", "-%"),
          _buildDivider(),
          _buildInfoRow("Investment State", "Short –Long"),
          _buildDivider(),
          _buildInfoRow("Total Number of investors allowed", "35"),
          _buildDivider(),
          _buildInfoRow("Maximum no.in.short", "20"),
          _buildDivider(),
          _buildInfoRow("Maximum no.in.long", "15"),
          _buildDivider(),
          _buildInfoRow("Investment State", "Short –Long"),
          _buildDivider(),
          _buildInfoRow("Minimum investment", "7,000 L.E"),
          _buildDivider(),
          _buildInfoRow("Maximum investment", "55,000 L.E"),
          _buildDivider(),
          _buildInfoRow("Minimum Short term", "7,000 L.E"),
          _buildDivider(),
          _buildInfoRow("Minimum Long term", "36,000 L.E"),
          _buildDivider(),
          _buildInfoRow("Deadline", "-"),
          _buildDivider(),
          _buildInfoRow("Store Type", "Warehouse – Physical Store"),
          _buildDivider(),
          _buildInfoRow("Location", "New Cairo – Nasr City"),
          _buildDivider(),
          _buildInfoRow("Website", "zerosugarbyetonista.com"),
          _buildDivider(),
          Text(
            "Social",
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(
                FontAwesomeIcons.xTwitter,
                size: 20,
                color: Color(0xFF082347),
              ),
              SizedBox(width: 15),
              Icon(
                FontAwesomeIcons.facebook,
                size: 20,
                color: Color(0xFF082347),
              ),
              SizedBox(width: 15),
              Icon(
                FontAwesomeIcons.instagram,
                size: 20,
                color: Color(0xFF082347),
              ),
              SizedBox(width: 15),
              Icon(
                FontAwesomeIcons.linkedinIn,
                size: 20,
                color: Color(0xFF082347),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // **[MODIFIED]** تحديد الشاشة بناءً على الـ _selectedIndex
    final Widget currentScreen;
    switch (_selectedIndex) {
      case 0: // Home Tab: يعرض محتوى FounderHomeScreen نفسه
        currentScreen =
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                ? Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
                : _buildHomeContent();
        break;
      case 1: // Community Tab
        // 2. تمرير الـ userId إلى FounderCommunityScreen
        currentScreen = FounderCommunityScreen(
          projectId: widget.projectId,
          userId: widget.userId,
        );
        break;
      case 2: // Reels Tab
        // 2. تمرير الـ userId إلى FounderReelsScreen
        currentScreen = FounderReelsScreen(
          projectId: widget.projectId,
          userId: widget.userId,
        );
        break;
      case 3: // Dashboard Tab
        // 2. تمرير الـ userId إلى FounderDashboardScreen
        currentScreen = const FounderDashboard();
        // FounderDashboardScreen(
        //   projectId: widget.projectId,
        //   userId: widget.userId,
        // );
        break;
      case 4: // Profile Tab
        // 2. تمرير الـ userId إلى FounderProfileScreen
        currentScreen = FounderProfileScreen(
          projectId: widget.projectId,
          userId: widget.userId,
        );
        break;
      default:
        currentScreen = const Center(child: Text("Unknown Screen"));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // هذا AppBar يمكن التحكم في ظهوره أو إخفائه حسب الـ selectedIndex
        // أو إزالته تماماً لو الشاشة الرئيسية لا تحتاج AppBar.
        // حالياً هو ظاهر دايماً، ويمكن إزالته لو تريد UI متطابق 100% مع الصورة الأصلية
        // التي لا تظهر App Bar في الـ Home Tab.
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF082347)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(child: currentScreen), // عرض الشاشة المختارة
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // لو رجعت للـ Home Tab (index 0)، اعمل refresh للبيانات
            // هذا لضمان تحديث البيانات عند العودة للـ Home tab.
            if (index == 0) {
              _fetchFounderData();
              _calculatePrediction();
            }
          });
        },
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Community"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: "Reels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChatBotModal(context);
        },
        backgroundColor: const Color(0xFF082347),
        mini: false,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.chat_bubble_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
