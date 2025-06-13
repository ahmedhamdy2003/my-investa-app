// community_screen.dart
import 'package:flutter/material.dart';
import 'community2_screen.dart'; // تأكد من المسار الصحيح
import 'package:investa4/nasar/investment_item.dart';
import 'package:investa4/nasar/investment_card.dart';

// --- Constants (قيم ثابتة قابلة للتعديل بسهولة) ---
const Color kScreenBackgroundColor = Colors.white;
const Color kMetricTextColor = Color(0xFF001F3F);
const double kCardDividerThickness = 1.0;
const double kMetricsDividerThickness = 2.0;
const double kInvestBtnWidth = 114.0;
const double kInvestBtnHeight = 32.0;
const Color kInvestBtnColor = Color(0xFF001F3F);
const Color kInvestBtnTextColor = Colors.white;

const Color kSearchBarFillColor = Color(
  0xFFF5F7FA,
); // تم تعديلها لتطابق الألوان المشتركة
const Color kSearchBarHintTextColor = Color(0xFF7E9ACF);
const Color kSearchBarIconColor = Color(0xFF7E9ACF);
// --- نهاية القيم الثابتة ---

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // <--- هام جداً: هذه البيانات حالياً Hardcoded.
  // إذا كانت ستأتي من API، ستحتاج إلى:
  // 1. إضافة Future<List<InvestmentItem>> _fetchCommunityItems()
  // 2. استخدام FutureBuilder في الـ build method لجلب وعرض البيانات.
  final List<InvestmentItem> allItems = [
    InvestmentItem(
      id: "invest_001", // <--- هام: تأكد أن الـ IDs دي فريدة وأنها تتطابق مع الـ IDs اللي ممكن تجيلك من الـ backend لو هتعمل مزامنة.
      assetImage: "assets/image (36).png",
      title: "FAKHR",
      description:
          "Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness.",
      investedAmount: "300,000 LE",
      investors: "33",
      category: "Fashion",
    ),
    InvestmentItem(
      id: "invest_002",
      assetImage: "assets/image (56).png",
      title: "Mother Naked",
      description:
          "Flipping the script on beauty: all about clean, glow-boosting products.",
      investedAmount: "270,000 LE",
      investors: "25",
      category: "Beauty",
    ),
    InvestmentItem(
      id: "invest_003",
      assetImage: "assets/image (23).png",
      title: "Zero Sugar By Ketonista",
      description:
          "We are specialized in Healthy, Keto, Sugar Free, Gluten Free Products",
      investedAmount: "450,000 LE",
      investors: "43",
      category: "Food & Beverage",
    ),
    InvestmentItem(
      id: "invest_004",
      assetImage: "assets/image (35).png",
      title: "Seemly",
      description: "Seemly brings simplicity and comfort to your wardrobe.",
      investedAmount: "260,000 LE",
      investors: "32",
      category: "Fashion",
    ),
    InvestmentItem(
      id: "invest_005",
      assetImage: "assets/image (40).png",
      title: "Beyond",
      description: "Empowering individuals through innovative tech solutions.",
      investedAmount: "320,000 LE",
      investors: "30",
      category: "Technology", // تأكد لو دي category موجودة في InterestsScreen
    ),
    InvestmentItem(
      id: "invest_006",
      assetImage: "assets/image (22).png",
      title: "Infuse",
      description: "Revolutionizing aromatherapy with cutting-edge blends.",
      investedAmount: "280,000 LE",
      investors: "27",
      category: "Health & Fitness",
    ),
    InvestmentItem(
      id: "invest_007",
      assetImage: "assets/image (30).png",
      title: "Eros",
      description: "Bringing artisanal coffee experiences to your doorstep.",
      investedAmount: "500,000 LE",
      investors: "45",
      category: "Food & Beverage",
    ),
  ];

  final List<Map<String, String>> investorPosts = [
    {
      'avatar': 'assets/Ahmed.png',
      'name': 'Ahmed Ali',
      'subtitle': 'invested in FAKHR / Seemly',
      'content':
          'Investing here is the best decision to help children in school and shift perceptions of healthy food. It’ll be a global company soon.',
    },
    {
      'avatar': 'assets/Rana.png',
      'name': 'Rana Atef',
      'subtitle': 'invested in Mother Naked / Beyond',
      'content':
          'Great vision here—clean beauty for everyone. I believe this is the next big thing in wellness.',
    },
    {
      'avatar': 'assets/omar.png',
      'name': 'Omar Saad',
      'subtitle': 'invested in Infuse / eros',
      'content':
          'I see strong growth potential, especially with the team’s track record. Excited to be on board!',
    },
  ];

  final List<Map<String, String>> discussionReplies = [
    {
      'avatar': 'assets/Rahma.png',
      'name': 'Rahma Radi',
      'subtitle': 'invested in FAKHR / Zero Sugar By Ketonista',
      'content':
          'I think the Fintech sector is the best, especially with the rise of electronic payments in Egypt.',
    },
    {
      'avatar': 'assets/Othman.png',
      'name': 'Othman Qadi',
      'subtitle': 'invested in FAKHR / Seemly',
      'content': 'Fast-food is profitable, but competition is intense.',
    },
    {
      'avatar': 'assets/Dr.png',
      'name': 'Dr. Norhan Salah',
      'subtitle': 'Founder of Zero Sugar By Ketonista',
      'content':
          'We offer a new healthy fast-food experience. Do you think this is a good investment?',
    },
    {
      'avatar': 'assets/omar.png',
      'name': 'Omar Saad',
      'subtitle': 'invested in Infuse / eros',
      'content':
          'Replied on Dr. Norhan: With a clear expansion plan and strong sales, the market definitely needs this!',
    },
  ];

  final List<Map<String, String>> opportunityMetrics = [
    {'label': 'Funding Goal', 'value': '500,000 L.E - 850,000 L.E'},
    {'label': 'Completed Funding', 'value': '330,000 L.E'},
    {'label': 'Expected Success Rate', 'value': '93%'},
    {'label': 'Investment State', 'value': 'Long term'},
    {'label': 'Minimum investment', 'value': '7,000 L.E'},
    {'label': 'Maximum investment', 'value': '14,000 L.E'},
    {'label': 'Minimum Short term', 'value': '7,000 L.E'},
    {'label': 'Minimum Long term', 'value': '36,000 L.E'},
    {'label': 'Deadline', 'value': '16 Oct, 2025'},
    {'label': 'Store Type', 'value': 'Warehouse - Physical Store'},
    {'label': 'Location', 'value': 'New Cairo - Nasr City'},
    {'label': 'Website', 'value': 'zerosugarbyketonista.com'},
    {'label': 'Social', 'value': 'f'},
  ];

  final List<Map<String, String>> latestDiscussions = [
    {
      'avatar': 'assets/Rana.png',
      'name': 'Rana Atef',
      'subtitle': 'Founder of Zero Sugar By Ketonista',
      'content':
          'We offer a new healthy fast-food experience. Do you think this is a good investment?',
    },
    {
      'avatar': 'assets/omar.png',
      'name': 'Omar Saad',
      'subtitle': 'invested in FAKHR / Seemly',
      'content':
          'Investing here is the best decision to help children in school and shift perceptions of healthy food.',
    },
  ];

  String _searchQuery = ''; // لمدخل البحث
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF003366);
    const accentRed = Color(0xFFE53935);
    const dividerColor = Color(0xFFDDDDDD);

    final filteredItems =
        allItems
            .where(
              (item) =>
                  item.title.toLowerCase().contains(_searchQuery.toLowerCase()),
            )
            .toList();

    return Scaffold(
      backgroundColor: kScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScreenBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false, // إزالة سهم الرجوع
        titleSpacing: 16,
        title: Row(
          children: [
            // <--- تأكد من وجود ملف الصورة assets/logo.png
            Image.asset('assets/logo.png', width: 70, height: 70),
            const SizedBox(width: 8),
            const Text(
              'INVESTA',
              style: TextStyle(
                color: primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active, color: primaryBlue),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Trending Brands + Search
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Trending Brands',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  if (mounted) {
                    // <--- تعديل: فحص mounted
                    setState(() {
                      _searchQuery = value;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search Trending Brands',
                  hintStyle: const TextStyle(
                    color: kSearchBarHintTextColor,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: kSearchBarFillColor,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kSearchBarIconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- 4 Cards (Filtered by search)
            ListView.builder(
              key: ValueKey(
                'community_trending_list_${filteredItems.hashCode}',
              ), // <--- تعديل: إضافة Key
              itemCount: filteredItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                final it = filteredItems[i];
                return Padding(
                  key: ValueKey(
                    it.id,
                  ), // <--- تعديل: إضافة Key لكل InvestmentCard
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: InvestmentCard(
                    assetImage: it.assetImage,
                    title: it.title,
                    description: it.description,
                    investedAmount: it.investedAmount,
                    investors: it.investors,
                    onTap: () {
                      // <--- هام جداً: هذا المنطق hardcoded للـ 'FAKHR'
                      // يجب تحديثه للانتقال لصفحة تفاصيل مشروع ديناميكية
                      if (it.title == 'FAKHR') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Community2Screen(),
                          ),
                        );
                      } else {
                        print('Tapped on ${it.title} in Community List');
                        // هنا ممكن توجيه لصفحة تفاصيل مشروع عامة
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx) => ProjectDetailsPage(item: it)));
                      }
                    },
                    onBookmarkPressed: () {
                      // <--- هام: هنا يمكن إضافة منطق الحفظ لـ CommunityScreen
                      // هذا الجزء لم يتم ربطه بالـ _toggleBookmark function في HomeScreen.
                      // ستحتاج إلى تمرير _toggleBookmark (أو منطق مشابه) من HomeScreen هنا
                      // أو استخدام State Management.
                      print(
                        'Bookmark pressed for ${it.title} in Community List',
                      );
                    },
                    isSaved:
                        false, // <--- هام: تحتاج إلى ربط هذا بحالة الحفظ الفعلية
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Invest button pressed on Community List');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kInvestBtnColor,
                  foregroundColor: kInvestBtnTextColor,
                  fixedSize: const Size(kInvestBtnWidth, kInvestBtnHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Invest'),
              ),
            ),
            const SizedBox(height: 24),

            // --- Investors Posts (باقي الأقسام تظل كما هي حالياً)
            // <--- هام جداً: هذه البيانات حالياً Hardcoded.
            // إذا كانت ستأتي من API، ستحتاج إلى:
            // 1. إضافة Future<List<Map<String, String>>> _fetchInvestorPosts()
            // 2. استخدام FutureBuilder هنا لجلب وعرض البيانات.
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
              child: Text(
                'Investors Posts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            ListView.separated(
              key: const ValueKey(
                'investor_posts_list',
              ), // <--- تعديل: إضافة Key
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: investorPosts.length,
              separatorBuilder:
                  (_, __) => const Divider(
                    color: dividerColor,
                    thickness: kCardDividerThickness,
                  ),
              itemBuilder: (c, i) {
                final p = investorPosts[i];
                return Padding(
                  key: ValueKey(p['name']), // <--- تعديل: إضافة Key لكل عنصر
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(p['avatar']!),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p['name']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: primaryBlue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  p['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: primaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(p['content']!),
                    ],
                  ),
                );
              },
            ),

            // --- Latest Discussions
            // <--- هام جداً: هذه البيانات حالياً Hardcoded.
            // إذا كانت ستأتي من API، ستحتاج إلى:
            // 1. إضافة Future<List<Map<String, String>>> _fetchDiscussions()
            // 2. استخدام FutureBuilder هنا لجلب وعرض البيانات.
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
              child: Text(
                'Latest Discussions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'What is the best sectors to invest in 2025?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentRed,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              key: const ValueKey(
                'discussion_replies_list',
              ), // <--- تعديل: إضافة Key
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: discussionReplies.length,
              separatorBuilder:
                  (_, __) => const Divider(
                    color: dividerColor,
                    thickness: kCardDividerThickness,
                  ),
              itemBuilder: (c, i) {
                final p = discussionReplies[i];
                final isOmar =
                    p['name'] == 'Omar Saad'; // هذا الشرط يبدو خاصاً جداً
                final leftPad = isOmar ? 32.0 : 16.0; // وهذا التعديل بناءً عليه
                return Padding(
                  key: ValueKey(p['name']), // <--- تعديل: إضافة Key لكل عنصر
                  padding: EdgeInsets.symmetric(
                    horizontal: leftPad,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(p['avatar']!),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p['name']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: primaryBlue,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  p['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: primaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(p['content']!),
                    ],
                  ),
                );
              },
            ),

            // --- Investment Opportunities + Metrics
            // <--- هام جداً: هذه البيانات حالياً Hardcoded.
            // إذا كانت ستأتي من API، ستحتاج إلى:
            // 1. إضافة Future<InvestmentItem> _fetchOpportunityDetails()
            // 2. استخدام FutureBuilder هنا لجلب وعرض البيانات.
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
              child: Text(
                'Investment Opportunities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InvestmentCard(
                assetImage: 'assets/opportunity.png',
                title: 'Zero Sugar By Ketonista',
                description:
                    'We are specialized in Healthy, Keto, Sugar Free, Gluten Free Products',
                investedAmount: '450,000 LE',
                investors: '43',
                onTap: () {},
                onBookmarkPressed: () {},
                isSaved: false, // <--- هام: تحتاج لربط هذا بحالة الحفظ الفعلية
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children:
                    opportunityMetrics.asMap().entries.map((e) {
                      final idx = e.key;
                      final m = e.value;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    m['label']!,
                                    style: const TextStyle(
                                      color: kMetricTextColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  m['value']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kMetricTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (idx != opportunityMetrics.length - 1)
                            const Divider(
                              thickness: kMetricsDividerThickness,
                              color: dividerColor,
                            ),
                        ],
                      );
                    }).toList(),
              ),
            ),

            // --- See more
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFD9E4FF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 21,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Community2Screen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See more',
                      style: TextStyle(color: kMetricTextColor),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // --- Invest button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kInvestBtnColor,
                  foregroundColor: kInvestBtnTextColor,
                  fixedSize: const Size(kInvestBtnWidth, kInvestBtnHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Invest'),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
