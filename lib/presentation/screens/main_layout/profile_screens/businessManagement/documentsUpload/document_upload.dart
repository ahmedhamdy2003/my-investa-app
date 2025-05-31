import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class DocumentsUploadScreen extends StatelessWidget {
  const DocumentsUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:ColorsManagers.white,

      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8), // هامش حول الدائرة
          decoration: BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('DocumentsUpload', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Here, you can upload or modify your official documents:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            _buildUploadItem(title: 'Commercial Registration :', action: 'Update'),
            _buildUploadItem(title: 'Tax Card :'),
            _buildUploadItem(title: 'Ownership or Lease Proof :'),
            _buildUploadItem(title: 'Income Report or Bank Statements:'),
            _buildUploadItem(title: 'Photos/Contracts of Manufacturing or Service provision:'),
            const SizedBox(height: 24),
            const Row(
              children: [
                Icon(Icons.push_pin, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Important Note before confirming document upload:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '''
• The attached documents are reviewed by our specialized team to verify their accuracy and approve them within the platform.
• Expected review time: up to 8 working hours at most.
• You will be notified once the document is approved or if there are any remarks requiring re-upload.
              ''',
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 24),
            const Text(
              'Why is this phase important?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
• To protect investors and ensure there are no fake projects.
• The documents are not visible to investors but are verified internally.
• Once the documents are approved, the user can start completing the remaining steps to build their project page.
              ''',
              style: TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadItem({required String title, String action = 'Upload'}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
          TextButton(
            onPressed: () {
              // handle upload
            },
            child: Text(
              action,
              style: const TextStyle(
                color: Color(0xFF1A237E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
