import 'package:flutter/material.dart';
import 'package:investa4/core/assets_managers.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class AiHistory extends StatelessWidget {
  const AiHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorsManagers.white,

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
        title: const Text('AI Evaluation History', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Some data can be edited before your project is published for investors, such as:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Text('• Success Probability:'),
                Spacer(),
                Text(
                  '91%',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'AI prediction for future success',
              style: TextStyle(
                color: ColorsManagers.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChartColumn('Success', AssetsManagers.successFlowChart, context),
                _buildChartColumn('Failure', AssetsManagers.failureFlowChart, context),
              ],
            ),
            const SizedBox(height: 32),

            // Success Probability Image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• Success Probability:'),
                const SizedBox(height: 8),
                Center(
                  child: Image.asset(
                    AssetsManagers.investors,
                    fit: BoxFit.contain,
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32), Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  SWOT Analysis :'),
                const SizedBox(height: 8),
                Center(
                  child: Image.asset(
                    AssetsManagers.swotAnalysis,
                    fit: BoxFit.contain,
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  Benchmarking (Comparing with Similar Projects) :'),
                const SizedBox(height: 8),
                Center(
                  child: Image.asset(
                    AssetsManagers.benchMarking,
                    fit: BoxFit.contain,
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // SWOT Analysis
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text('• SWOT Analysis:'),
            //     const SizedBox(height: 8),
            //     Center(
            //       child: Image.asset(
            //         AssetsManagers.swotAnalysis,
            //         fit: BoxFit.contain,
            //         width: 300,
            //         height: 300,
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 32),
            //
            // // Benchmarking
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text('• Benchmarking (Comparing with Similar Projects):'),
            //     const SizedBox(height: 8),
            //     Center(
            //       child: Image.asset(
            //         AssetsManagers.benchMarking,
            //         fit: BoxFit.contain,
            //         width: 300,
            //         height: 300,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  static Widget _buildChartColumn(String label, String imagePath, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.30;

    return Column(
      children: [
        Image.asset(
          imagePath,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Text('-%'),
      ],
    );
  }
}
