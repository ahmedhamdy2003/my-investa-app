//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FAQScreen extends StatelessWidget {
//   final List<Map<String, String>> faqList = [
//     {
//       'question': 'إزاي أعمل حساب؟',
//       'answer': 'تدخل على صفحة التسجيل وتكتب اسمك والبريد وكلمة السر، وبعدين تضغط تسجيل.'
//     },
//     {
//       'question': 'إزاي أطلب منتج؟',
//       'answer': 'ضيف المنتج للسلة وبعدين اضغط على "إتمام الطلب" واتبع التعليمات.'
//     },
//     {
//       'question': 'هل الشحن مجاني؟',
//       'answer': 'الشحن مجاني للطلبات اللي قيمتها فوق 500 جنيه.'
//     },
//     {
//       'question': 'إزاي أتواصل مع الدعم؟',
//       'answer': 'من خلال صفحة "اتصل بنا" أو على الواتساب مباشرة.'
//     },
//   ];
//
//    FAQScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('الأسئلة الشائعة'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: faqList.length,
//         itemBuilder: (context, index) {
//           final item = faqList[index];
//           return Card(
//             margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: ExpansionTile(
//               title: Text(
//                 item['question']!,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(item['answer']!),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }