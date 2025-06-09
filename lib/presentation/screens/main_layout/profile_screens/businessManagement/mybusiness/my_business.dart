// import 'package:flutter/material.dart';
//
// class MyBusiness extends StatelessWidget {
//   const MyBusiness({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FAKHR'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Hero Banner
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://example.com/fakhr-banner.jpg'), // Replace with your image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   'Celebrate Your Journey',
//                   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10,
//                         color: Colors.black.withOpacity(0.8),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // About Section
//             const SectionTitle(title: 'About Fakhr'),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//
//             // Categories
//             const SectionTitle(title: 'Our Collections'),
//             SizedBox(
//               height: 150,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: const [
//                   CategoryCard(title: 'Summer', icon: Icons.sunny),
//                   CategoryCard(title: 'Winter', icon: Icons.ac_unit),
//                   CategoryCard(title: 'Accessories', icon: Icons.style),
//                 ],
//               ),
//             ),
//
//             // Products Grid
//             const SectionTitle(title: 'Featured Products'),
//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               childAspectRatio: 0.75,
//               padding: const EdgeInsets.all(8),
//               children: const [
//                 ProductCard(name: 'Premium T-Shirt', price: 'EGP 299'),
//                 ProductCard(name: 'Designer Hoodie', price: 'EGP 599'),
//                 ProductCard(name: 'Swim Shorts', price: 'EGP 349'),
//                 ProductCard(name: 'Stylish Cap', price: 'EGP 199'),
//               ],
//             ),
//
//             // Contact Info
//             const SectionTitle(title: 'Contact Us'),
//             const ContactInfo(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Browse',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SectionTitle extends StatelessWidget {
//   final String title;
//
//   const SectionTitle({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//
//   const CategoryCard({
//     super.key,
//     required this.title,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       child: InkWell(
//         onTap: () {},
//         child: SizedBox(
//           width: 120,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 40, color: Theme.of(context).primaryColor),
//               const SizedBox(height: 8),
//               Text(title),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final String name;
//   final String price;
//
//   const ProductCard({
//     super.key,
//     required this.name,
//     required this.price,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Container(
//               color: Colors.grey[200],
//               child: const Icon(Icons.photo, size: 60, color: Colors.grey),
//               // Replace with Image.network() for actual product images
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(price),
//                 const SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 36),
//                   ),
//                   child: const Text('Add to Cart'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ContactInfo extends StatelessWidget {
//   const ContactInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Column(
//         children: [
//           ListTile(
//             leading: Icon(Icons.location_on),
//             title: Text('12 El Tahrir Street, Ground Floor'),
//             subtitle: Text('Dokki District, Giza Governorate'),
//           ),
//           ListTile(
//             leading: Icon(Icons.phone),
//             title: Text('+20 100 123 4567'),
//           ),
//           ListTile(
//             leading: Icon(Icons.email),
//             title: Text('contact@fakhr.com'),
//           ),
//           ListTile(
//             leading: Icon(Icons.access_time),
//             title: Text('Operating since March 2024'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investa4/core/routes_manager/colors_managers.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8), // هامش حول الدائرة
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // شكل دائري
            color: ColorsManagers.darkBlue, // لون الخلفية
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ), // لون السهم أبيض
            onPressed: () => Navigator.pop(context), // وظيفة الرجوع
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('My Business', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("Project Name", "Fakhr"),
            _buildSection(
              "Description",
              "Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness.",
            ),
            _buildSection("Logo", ""),
            Center(child: Image.asset("assets/images/fakhr.png", height: 100)),
            _buildSection("Field", "Fashion"),
            _buildSection(
              "Type of Activity",
              "Summer wears / Winter wears / Accessories\n(T-shirts, Shorts, Tops, Chemises, Swim shorts, Skirts, Pants, Hoodies, Sweat pants, Jackets, Caps, Socks)",
            ),
            _buildSection(
              "Project Location (if physical or online)",
              "Online Store",
            ),
            _buildSection(
              "Address (warehouse)",
              "12 El Tahrir Street, Ground Floor,\nIn front of Dokki Metro Station\nDokki District, Giza Governorate",
            ),
            _buildSection("Postal Code", "12611"),
            _buildSection("Phone", "+20 100 123 4567"),
            _buildSection(
              "Operating Duration",
              "Started Operation in: March 2024\nTotal Duration: 2 years and 2 months",
            ),
            _buildSection(
              "Number of Branches",
              "Main Branch: Dokki, Giza\nBranch 2: New Cairo, Fifth Settlement\nTotal Branches: 2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: "$title:\n",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }
}
