// import 'package:flutter/material.dart';
//
// class ProductDescriptionScreen extends StatefulWidget {
//   const ProductDescriptionScreen({super.key});
//
//   @override
//   State<ProductDescriptionScreen> createState() => _ProductDescriptionScreenState();
// }
//
// class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFBEFF0),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Product Description',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           TextButton(
//             onPressed: null, // غير مفعل الآن
//             child: const Text('Save', style: TextStyle(color: Colors.grey)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Each product you offer :', style: TextStyle(fontSize: 16)),
//             const SizedBox(height: 16),
//             // Card(
//             //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             //   elevation: 3,
//             //   child: Column(
//             //     children: [
//             //       ClipRRect(
//             //         borderRadius: BorderRadius.circular(12),
//             //         child: Image.asset(
//             //           'assets/images/tshirt.png', // ضع هنا مسار الصورة
//             //           fit: BoxFit.cover,
//             //         ),
//             //       ),
//             //       const SizedBox(height: 12),
//             //       const Text(
//             //         'T-shirt',
//             //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             //       ),
//             //       const Text(
//             //         '500 L.E',
//             //         style: TextStyle(color: Colors.black54),
//             //       ),
//             //       const SizedBox(height: 12),
//             //     ],
//             //   ),
//             // ),
//             const SizedBox(height: 24),
//             const Text(
//               'distribution channels:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               '''
// • Age range: 18 to 30 years old.
// • Interested in fashion and casual styles.
// • University students or recent employees.
// • Interested in local brands at affordable prices.
// • Active online and shop through Instagram or websites.
//               ''',
//               style: TextStyle(height: 1.6),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Target Audience:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             _buildCheckboxItem(
//               'Direct Sales Outlets (Physical stores):\nHas one or more stores (like an exhibition or showroom).',
//               example: 'Example: We have two branches in Tagamoa and Sheikh Zayed.',
//             ),
//             _buildCheckboxItem(
//               'Indirect Sales Outlets:\nDistributed through other shops or chains.',
//               example: 'Example: Products sold at Spinneys, Carrefour, Market...',
//             ),
//             _buildCheckboxItem(
//               'Online:\nHas an e-commerce store (Shopify, Zid, WooCommerce).\nSells via Instagram, Facebook, TikTok shop.',
//               example: 'Also uses Jumia, Amazon, Talabat Mart...',
//             ),
//             _buildCheckboxItem(
//               'Delivery Apps (for F&B):\nUses Talabat, Rabbit, Breadfast, etc.',
//             ),
//             _buildCheckboxItem(
//               'Food Truck or Pop-up Booth:\nParticipates in temporary events or markets.',
//               example: 'Example: Zamalek Market or Sahel Events.',
//             ),
//             _buildCheckboxItem(
//               'Agents or Distributors:\nHas sales partners or distributors.',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCheckboxItem(String text, {String? example}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Checkbox(value: false, onChanged: null),
//           const SizedBox(width: 4),
//           Expanded(
//             child: RichText(
//               text: TextSpan(
//                 style: const TextStyle(color: Colors.black, height: 1.4),
//                 children: [
//                   TextSpan(text: '$text\n'),
//                   if (example != null)
//                     TextSpan(
//                       text: example,
//                       style: const TextStyle(color: Colors.grey),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:investa4/core/assets_managers.dart';
//
// class ProductCardScreen extends StatelessWidget {
//   const ProductCardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFBEFF0), // الخلفية الوردية
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Product Description',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Each product you offer :',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5E8EA),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.asset(
//                       AssetsManagers.model, // ✅ غيّر ده لمسار الصورة في مشروعك
//                       height: 300,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'T-shirt',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text(
//                     '500 L.E',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _DotIndicator(isActive: true),
//                       SizedBox(width: 6),
//                       _DotIndicator(isActive: false),
//                       SizedBox(width: 6),
//                       _DotIndicator(isActive: false),
//                       SizedBox(width: 6),
//                       _DotIndicator(isActive: false),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _DotIndicator extends StatelessWidget {
//   final bool isActive;
//   const _DotIndicator({required this.isActive});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: 8,
//       height: 8,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? Colors.black : Colors.grey.shade400,
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// class ProductSliderScreen extends StatefulWidget {
//   const ProductSliderScreen({super.key});
//
//   @override
//   State<ProductSliderScreen> createState() => _ProductSliderScreenState();
// }
//
// class _ProductSliderScreenState extends State<ProductSliderScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<String> imagePaths = [
//     'assets/images/tshirt1.png',
//     'assets/images/tshirt2.png',
//     'assets/images/tshirt3.png',
//     'assets/images/tshirt4.png',
//     'assets/images/tshirt5.png',
//     'assets/images/tshirt6.png',
//     'assets/images/tshirt7.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFBEFF0),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Product Description',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Each product you offer:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5E8EA),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 300,
//                     child: PageView.builder(
//                       controller: _pageController,
//                       itemCount: imagePaths.length,
//                       onPageChanged: (index) {
//                         setState(() {
//                           _currentPage = index;
//                         });
//                       },
//                       itemBuilder: (context, index) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.asset(
//                             imagePaths[index],
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       imagePaths.length,
//                           (index) => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: _DotIndicator(isActive: index == _currentPage),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'T-shirt',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   const Text(
//                     '500 L.E',
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _DotIndicator extends StatelessWidget {
//   final bool isActive;
//   const _DotIndicator({required this.isActive});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: 8,
//       height: 8,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? Colors.black : Colors.grey.shade400,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:investa4/core/routes_manager/colors_managers.dart';
//
// import '../../../../../../core/assets_managers.dart';
//
// class ProductSliderScreen extends StatefulWidget {
//   const ProductSliderScreen({super.key});
//
//   @override
//   State<ProductSliderScreen> createState() => _ProductSliderScreenState();
// }
//
// class _ProductSliderScreenState extends State<ProductSliderScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<String> imagePaths = [
//     AssetsManagers.model1,
//     AssetsManagers.model2,
//     AssetsManagers.model3,
//     AssetsManagers.model4,
//     AssetsManagers.model5,
//     AssetsManagers.model6,
//     AssetsManagers.model7,
//     AssetsManagers.model8,
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManagers.white,
//
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.all(8), // هامش حول الدائرة
//           decoration: BoxDecoration(
//             shape: BoxShape.circle, // شكل دائري
//             color: ColorsManagers.darkBlue, // لون الخلفية
//           ),
//           child: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white), // لون السهم أبيض
//             onPressed: () => Navigator.pop(context), // وظيفة الرجوع
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: const Text('Product Description', style: TextStyle(color: Colors.black)),
//         centerTitle: false,
//         elevation: 0,
//       ),      body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Each product you offer:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               decoration: BoxDecoration(
//                 color: ColorsManagers.offWhite,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 300,
//                     child: PageView.builder(
//                       controller: _pageController,
//                       itemCount: imagePaths.length,
//                       onPageChanged: (index) {
//                         setState(() {
//                           _currentPage = index;
//                         });
//                       },
//                       itemBuilder: (context, index) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.asset(
//                             imagePaths[index],
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       imagePaths.length,
//                           (index) => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5),
//                         child: _DotIndicator(isActive: index == _currentPage),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'T-shirt',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   const Text(
//                     '500 L.E',
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _DotIndicator extends StatelessWidget {
//   final bool isActive;
//   const _DotIndicator({required this.isActive});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: 8,
//       height: 8,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isActive ? Colors.black : Colors.grey.shade400,
//       ),
//     );
//
//   }
// }

import 'package:flutter/material.dart';
import '../../../../../../core/assets_managers.dart';
import '../../../../../../core/routes_manager/colors_managers.dart';

class ProductDescriptionScreen extends StatefulWidget {
  const ProductDescriptionScreen({super.key});

  @override
  State<ProductDescriptionScreen> createState() => _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imagePaths = [
    AssetsManagers.model1,
    AssetsManagers.model2,
    AssetsManagers.model3,
    AssetsManagers.model4,
    AssetsManagers.model5,
    AssetsManagers.model6,
    AssetsManagers.model7,
    AssetsManagers.model8,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        backgroundColor: ColorsManagers.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Description',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: null, // غير مفعل الآن
            child: const Text('Save', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Each product you offer:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Image slider container
            Container(
              decoration: BoxDecoration(
                color: ColorsManagers.offWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imagePaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imagePaths.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _DotIndicator(isActive: index == _currentPage),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'T-shirt',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '500 L.E',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Distribution channels section
            const Text(
              'Distribution Channels:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
• Age range: 18 to 30 years old.
• Interested in fashion and casual styles.
• University students or recent employees.
• Interested in local brands at affordable prices.
• Active online and shop through Instagram or websites.
              ''',
              style: TextStyle(height: 1.6),
            ),
            const SizedBox(height: 24),

            // Target audience section
            const Text(
              'Target Audience:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildCheckboxItem(
              'Direct Sales Outlets (Physical stores):\nHas one or more stores (like an exhibition or showroom).',
              example: 'Example: We have two branches in Tagamoa and Sheikh Zayed.',
            ),
            _buildCheckboxItem(
              'Indirect Sales Outlets:\nDistributed through other shops or chains.',
              example: 'Example: Products sold at Spinneys, Carrefour, Market...',
            ),
            _buildCheckboxItem(
              'Online:\nHas an e-commerce store (Shopify, Zid, WooCommerce).\nSells via Instagram, Facebook, TikTok shop.',
              example: 'Also uses Jumia, Amazon, Talabat Mart...',
            ),
            _buildCheckboxItem(
              'Delivery Apps (for F&B):\nUses Talabat, Rabbit, Breadfast, etc.',
            ),
            _buildCheckboxItem(
              'Food Truck or Pop-up Booth:\nParticipates in temporary events or markets.',
              example: 'Example: Zamalek Market or Sahel Events.',
            ),
            _buildCheckboxItem(
              'Agents or Distributors:\nHas sales partners or distributors.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String text, {String? example}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Checkbox(value: false, onChanged: null),
          const SizedBox(width: 4),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, height: 1.4),
                children: [
                  TextSpan(text: '$text\n'),
                  if (example != null)
                    TextSpan(
                      text: example,
                      style: const TextStyle(color: Colors.grey),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dot indicator for the PageView
  Widget _DotIndicator({required bool isActive}) {
    return Container(
      width: isActive ? 12 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.grey,
      ),
    );
  }
}
