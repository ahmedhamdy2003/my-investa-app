// investment_item.dart

class InvestmentItem {
  final String assetImage;
  final String title;
  final String description;
  final String investedAmount;
  final String investors;
  final String category; // <-- NEW: Add category field

  InvestmentItem({
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
    required this.category, // <-- NEW: Make it required
  });

  factory InvestmentItem.fromJson(Map<String, dynamic> json) {
    return InvestmentItem(
      assetImage: json['image_url'] ?? 'assets/default_project.png',
      title: json['title'] ?? 'N/A',
      description: json['description'] ?? 'No description available.',
      investedAmount: json['invested_amount']?.toString() ?? '0 EGP',
      investors: json['investors']?.toString() ?? '0',
      category: json['category'] ??
          'Uncategorized', // <-- NEW: Map 'category' from JSON
    );
  }
}
