import 'package:flutter/material.dart';
import 'package:investa4/core/model/user.dart';

// تأكد من أن هذا المسار صحيح لملف FounderHomeScreen
import 'package:investa4/nasar/founderHome_screen.dart'; // تأكد أن المسار ده صح

class phaseThree_screen extends StatefulWidget {
  // 1. إضافة projectId كـ parameter مطلوب في constructor
  final String projectId;
  // 1. أضف خاصية userId هنا
  final String? userId; // <--- هنا تم إضافة الـ userId

  const phaseThree_screen({
    super.key,
    required this.projectId,
    this.userId,
  }); // <--- هنا تم استقبال الـ userId

  @override
  State<phaseThree_screen> createState() => _PhaseThreeScreenState();
}

class _PhaseThreeScreenState extends State<phaseThree_screen> {
  // هذه المتغيرات لم تعد ضرورية بعد إزالة وظائف اختيار/رفع الملفات
  // File? _selectedFilePage1;
  // File? _selectedFilePage2;
  // bool _isUploading = false;

  // دالة للانتقال إلى FounderHomeScreen
  void _navigateToFounderHome() {
    UserMethods.setUserisFounder(true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // 2. تمرير الـ projectId والـ userId المستلم إلى FounderHomeScreen
        builder:
            (context) => FounderHomeScreen(
              projectId: widget.projectId,
              userId: widget.userId, // <--- هنا تم تمرير الـ userId
            ), // تمرير projectId
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _PageOne(
        projectId: widget.projectId,
        userId: widget.userId,
      ), // لا حاجة لتمرير onPickFile أو selectedFile
      _PageTwo(
        projectId: widget.projectId,
        userId: widget.userId,
      ), // لا حاجة لتمرير onPickFile أو selectedFile
      _PageThree(
        onGotIt: _navigateToFounderHome, // استدعاء دالة الانتقال مباشرة
        isUploading: false, // دائمًا false بما أنه لا يوجد رفع ملفات
        projectId: widget.projectId, // تمرير projectId
        userId: widget.userId, // تمرير userId
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: 30,
          child: Image.asset('assets/blue_shape.png', width: 240, height: 250),
        ),
        Positioned(
          top: 38,
          right: -10,
          child: Image.asset('assets/dark_shape.png', width: 80),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset('assets/shape.png', width: 240),
        ),
      ],
    );
  }
}

class _PageOne extends StatelessWidget {
  // 1. أضف خاصية userId و projectId هنا
  final String? userId;
  final String projectId;

  // 2. عدّل الـ constructor لاستقبال الـ userId و projectId
  const _PageOne({this.userId, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            270,
            20,
            20,
          ), // تحت الصور على طول
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // بادئ من الشمال
              children: [
                // [DEBUG] لعرض الـ userId والـ projectId للتأكد من وصولهما
                if (userId != null && userId!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "User ID: $userId",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Project ID: $projectId",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Text(
                  'Phase3: \n\n✅ Basic legal documents required to prove the existence of a project in Egypt (physical store):',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Commercial registration: To prove that the project is officially registered with the state.\n\n'
                  '2. Even home-based projects can now register themselves as "small or micro projects".\n\n'
                  '3. Tax card: To verify that the project pays taxes and is recognized by the tax authority.\n\n'
                  '4. Very important, especially for financial transactions and investments.\n\n'
                  '5. Operating license: If the project operates in a location like a shop, food truck, or café, a license from the neighborhood/local authority is required.\n\n'
                  '6. For home-based projects, it’s not mandatory but having approval or permit from the Micro, Small, and Medium Enterprises Development Authority (MSME) is recommended.\n\n'
                  '7. Lease or ownership contract: To confirm an active place for the activity.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PageTwo extends StatelessWidget {
  // 1. أضف خاصية userId و projectId هنا
  final String? userId;
  final String projectId;

  // 2. عدّل الـ constructor لاستقبال الـ userId و projectId
  const _PageTwo({this.userId, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 270, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // [DEBUG] لعرض الـ userId والـ projectId للتأكد من وصولهما
                if (userId != null && userId!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "User ID: $userId",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Project ID: $projectId",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Text(
                  'Phase3: \n\n✅ Basic legal documents required to prove the existence of a project in Egypt (home-based projects):',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. A declaration from the owner that they are conducting the activity from a specific location, along with photos of that place.\n\n'
                  '2. Invoices for raw material purchases or product sales in the last 3 months.\n\n'
                  '3. Active social media links + the number of orders/customers over the past months.\n\n'
                  '4. A certificate from the Micro, Small, and Medium Enterprises Development Agency (MSME) if applying for government support or training there.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PageThree extends StatelessWidget {
  final VoidCallback onGotIt;
  final bool isUploading;
  // 1. أضف خاصية userId و projectId هنا
  final String? userId;
  final String projectId;

  // 2. عدّل الـ constructor لاستقبال الـ userId و projectId
  const _PageThree({
    required this.onGotIt,
    required this.isUploading,
    this.userId, // يمكن أن تكون null
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundHeader(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 270, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // [DEBUG] لعرض الـ userId والـ projectId للتأكد من وصولهما
                if (userId != null && userId!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "User ID: $userId",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Project ID: $projectId",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Text(
                  '📊 Monthly audit: How to learn it?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  '\nRevenue and expense report (very simple, in Excel or Google Sheets)\n'
                  'Number of orders or new customers\n'
                  'Fixed and variable expenses',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Any debts or installments paid\nInventory at the beginning, middle, and end of the month\nPhotos of the main invoices (purchases of raw materials – sales)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Color(0xFF082347),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 316,
                    height: 61,
                    child: ElevatedButton(
                      onPressed:
                          isUploading
                              ? null
                              : onGotIt, // لا يزال يحترم isUploading، على الرغم من أنه سيكون دائمًا false الآن
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF082347),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child:
                          isUploading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              )
                              : const Text(
                                'Got It',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
