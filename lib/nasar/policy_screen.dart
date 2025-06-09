// policy_screen.dart
import 'package:investa4/nasar/greatB_screen.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  // دالة مساعدة لبناء عنصر قائمة مرقمة
  Widget _buildNumberedListItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20, // لتثبيت عرض الرقم
            child: Text(
              '$number.',
              style: const TextStyle(
                fontSize: 15, // حجم الخط ليتناسب مع الصورة
                height: 1.4, // لتحديد تباعد الأسطر
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15, // حجم الخط ليتناسب مع الصورة
                height: 1.4, // لتحديد تباعد الأسطر
                color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لبناء عنصر قائمة نقطية
  Widget _buildBulletListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20, // لتثبيت عرض النقطة
            child: Icon(
              Icons.circle,
              size: 8,
              color: Color(0xFF5E6D7B),
            ), // نقطة صغيرة
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15, // حجم الخط ليتناسب مع الصورة
                height: 1.4, // لتحديد تباعد الأسطر
                color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء
      appBar: AppBar(
        backgroundColor: Colors.transparent, // شفافية الـ AppBar
        elevation: 0, // إزالة الظل
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ), // زرار الرجوع
          onPressed: () {
            Navigator.pop(context); // للعودة للصفحة السابقة
          },
        ),
        title: const Text(
          '9:41', // وقت الشاشة
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          // أيقونات الشبكة والبطارية
          Icon(Icons.signal_cellular_alt, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black, size: 20),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black, size: 20),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'You Must Agree',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Terms of Service(ToS) Section
            const Text(
              'Terms of Service(ToS)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text:
                        'A legal agreement that outlines the rules and guidelines users must follow when accessing and using the platform.\n',
                  ),
                  TextSpan(
                    text: 'Key components typically include:\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildNumberedListItem(
              1,
              'Acceptance of Terms: Clarify that by using the platform, users agree to comply with the ToS.',
            ),
            _buildNumberedListItem(
              2,
              'User Eligibility: Specify who can use the platform (e.g., age restrictions, or jurisdictional limitations).',
            ),
            _buildNumberedListItem(
              3,
              'Account Responsibilities: Detail user obligations regarding account creation, maintenance, and security.',
            ),
            _buildNumberedListItem(
              4,
              'Prohibited Activities: List activities that are not allowed (e.g., illegal content, spam, or unauthorized access).',
            ),
            _buildNumberedListItem(
              5,
              'Disclaimers: Information users about the limitations of the platform\'s services/products and disclaim liability for financial losses.',
            ),
            _buildNumberedListItem(
              6,
              'Limitation of Liability: Set the maximum liability of the platform for damages.',
            ),
            _buildNumberedListItem(
              7,
              'Intellectual Property Rights: Define the ownership of content and materials accessible or created on the platform.',
            ),
            _buildNumberedListItem(
              8,
              'Termination: Clauses to describe the conditions under which a user\'s account can be suspended or terminated.',
            ),
            _buildNumberedListItem(
              9,
              'Dispute Resolution: Establish procedures for resolving disputes (e.g., arbitration or mediation).',
            ),
            _buildNumberedListItem(
              10,
              'Governing Law: Specify the legal jurisdiction that governs the ToS.',
            ),
            const SizedBox(height: 30),

            // Privacy Policy Section
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text:
                        'Informs users about how their personal data is collected, used, stored, and protected. Key elements:\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildNumberedListItem(
              1,
              'Information Collection: Detail the types of data collected (e.g., personal identification, contact information, and financial details).',
            ),
            _buildNumberedListItem(
              2,
              'Use of Information: Explain how data is collected and utilized, including for account management, communication, and service improvement.',
            ),
            _buildNumberedListItem(
              3,
              'Data Sharing and Disclosure: Specify if and when personal information is shared with third parties (e.g., service providers or legal authorities).',
            ),
            _buildNumberedListItem(
              4,
              'Data Security Measures: Describe the safeguards in place to protect user data from unauthorized access or breaches.',
            ),
            _buildNumberedListItem(
              5,
              'User Rights: Inform users of their rights regarding their data (e.g., data access, correction, and deletion).',
            ),
            _buildNumberedListItem(
              6,
              'Cookies and Tracking Technologies: Explain the use of cookies and similar technologies and their purpose.',
            ),
            _buildNumberedListItem(
              7,
              'Data Retention: State how long personal information is retained and the criteria for data deletion.',
            ),
            _buildNumberedListItem(
              8,
              'International Data Transfers: If applicable, explain how data is transferred and protected across different countries.',
            ),
            _buildNumberedListItem(
              9,
              'Policy Updates: Inform users about how changes to the Privacy Policy will be communicated.',
            ),
            _buildNumberedListItem(
              10,
              'Contact Information: Provide a way for users to contact the company with privacy related questions.',
            ),
            const SizedBox(height: 30),

            // Security Considerations Section
            const Text(
              'Security Considerations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text:
                        'Given the sensitive nature of financial data, it\'s important to highlight important security measures, is crucial:\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildBulletListItem(
              'Data Encryption: Use encryption protocols to protect data in transit and at rest.',
            ),
            _buildBulletListItem(
              'Access Controls: Implement strict access controls to ensure only authorized personnel can access sensitive information.',
            ),
            _buildBulletListItem(
              'Regular Security Audits: Conduct periodic security assessments to identify and address vulnerabilities.',
            ),
            _buildBulletListItem(
              'Compliance with Regulations: Ensure adherence to relevant data protection laws (e.g., GDPR, CCPA) and industry standards.',
            ),
            _buildBulletListItem(
              'General Data Protection Regulation (GDPR) or the type of security protocol for data you provide in your platform; to educate users on best practices for protecting their accounts; to outline the Privacy Policies of established investment.',
            ),
            const SizedBox(height: 10), // مسافة بين الفقرات
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text:
                        'Types of privacy policies on established investment:\n',
                  ),
                  TextSpan(text: '•  Vanguard TM: '),
                  TextSpan(
                    text:
                        'Their Privacy Policy outlines how personal data is collected, used, and shared.\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '•  Generation IM: '),
                  TextSpan(
                    text:
                        'Their Privacy Policy focuses on data protection through various measures.\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '•  Two Sigma: '),
                  TextSpan(
                    text:
                        'Their Privacy Policy emphasizes data security and disclosure practices.\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // مسافة بين الفقرات
            const Text(
              'It\'s always prudent to consult with legal professionals to tailor these documents to your platform\'s specific needs and to ensure compliance with applicable laws and regulations.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF5E6D7B), // لون النص الرمادي الفاتح
                height: 1.4,
              ),
            ),
            const SizedBox(height: 30), // مسافة قبل الأزرار
            // Start of the "I Accept" and "Cancel" buttons section
            // This section is now part of the scrollable body
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to GreatBScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GreatBScreen(),
                    ),
                  );
                  print('I Accept button pressed. Navigating to GreatBScreen.');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xff001F3F,
                  ), // اللون الأزرق الداكن
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'I Accept',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // مسافة بين الأزرار
            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextButton(
                onPressed: () {
                  // TODO: منطق عند الإلغاء
                  print('Cancel button pressed.');
                  Navigator.pop(context); // العودة للخلف عند الإلغاء
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // إزالة أي padding افتراضي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF001F3F), // لون النص أزرق داكن
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24), // مسافة في نهاية الصفحة بعد الأزرار
          ],
        ),
      ),
      // bottomNavigationBar: null, // Remove bottomNavigationBar
    );
  }
}
