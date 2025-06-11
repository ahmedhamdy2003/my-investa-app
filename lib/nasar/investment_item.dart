// investment_item.dart

class InvestmentItem {
  final String id; // **[NEW]** إضافة خاصية الـ ID
  final String assetImage;
  final String title;
  final String description;
  final String
  investedAmount; // يفضل استخدام double/int هنا بدلاً من String لو هتعمل عليها عمليات حسابية
  final String investors; // يفضل استخدام int هنا
  final String category;

  InvestmentItem({
    required this.id, // **[NEW]** الـ ID بقى مطلوب في الـ constructor
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
    required this.category,
  });

  factory InvestmentItem.fromJson(Map<String, dynamic> json) {
    return InvestmentItem(
      id:
          json['id']?.toString() ??
          json['pk']?.toString() ??
          json['project_id']?.toString() ??
          'unknown_id', // **[NEW]** جلب الـ ID من الـ JSON. ابحث عن المفتاح الصحيح في backend بتاعك!
      assetImage: json['image_url'] ?? 'assets/default_project.png',
      title: json['title'] ?? 'N/A',
      description: json['description'] ?? 'No description available.',
      investedAmount: json['invested_amount']?.toString() ?? '0 EGP',
      investors: json['investors']?.toString() ?? '0',
      category: json['category'] ?? 'Uncategorized',
    );
  }

  // **[NEW]** إضافة operator == و hashCode للمقارنة الصحيحة بين الـ InvestmentItem objects
  // ده مهم جداً عشان .any() و .contains() يشتغلوا صح
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvestmentItem &&
          runtimeType == other.runtimeType &&
          id == other.id; // المقارنة بالـ ID هي اللي بتحدد إذا كانوا متساويين

  @override
  int get hashCode => id.hashCode;
}
