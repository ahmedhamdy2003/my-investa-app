import 'package:flutter/material.dart';
import 'community2_screen.dart';

/// ————————————————————————————
///  قيم ثابتة قابلة للتعديل بسهولة ↓
/// ————————————————————————————
const Color kScreenBackgroundColor = Colors.white;
const Color kMetricTextColor = Color(0xFF001F3F);
const double kCardDividerThickness = 1.0;
const double kMetricsDividerThickness = 2.0;
const double kInvestBtnWidth = 114.0;
const double kInvestBtnHeight = 32.0;
const Color kInvestBtnColor = Color(0xFF001F3F);
const Color kInvestBtnTextColor = Colors.white;

const Color kSearchBarFillColor = Color(0xFFF5F5F5);
const Color kSearchBarHintTextColor = Color(0xFF7E9ACF);
const Color kSearchBarIconColor = Color(0xFF7E9ACF);

/// ————————————————————————————
///  نهاية القيم القابلة للتعديل
/// ————————————————————————————

class InvestmentItemB {
  final String assetImage, title, description, investedAmount, investors;
  InvestmentItemB({
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
  });
}

class InvestmentCardB extends StatelessWidget {
  final String assetImage, title, description, investedAmount, investors;
  final VoidCallback onTap, onBookmarkPressed;
  final bool isSaved;

  const InvestmentCardB({
    Key? key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
    required this.onTap,
    required this.onBookmarkPressed,
    required this.isSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover + overlay title
            Stack(
              children: [
                Image.asset(assetImage,
                    width: double.infinity, height: 140, fit: BoxFit.cover),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(blurRadius: 4, color: Colors.black45)
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            // Title, description & bookmark
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF082347)),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: const Color(0xFF082347),
                        ),
                        onPressed: onBookmarkPressed,
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const Divider(thickness: kCardDividerThickness),
            // Invested & investors
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(investedAmount,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        const Text('invested',
                            style: TextStyle(
                                fontSize: 12, color: kMetricTextColor)),
                      ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(investors,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    const Text('investors',
                        style:
                            TextStyle(fontSize: 12, color: kMetricTextColor)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CommunityScreen(),
  ));
}

/// ————————————————————————————
///  الصفحة الأولى: CommunityScreen
/// ————————————————————————————
class CommunityScreen extends StatelessWidget {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (36).png",
      title: "FAKHR",
      description:
          "Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness.",
      investedAmount: "300,000 LE",
      investors: "33",
    ),
    InvestmentItemB(
      assetImage: "assets/image (56).png",
      title: "Mother Naked",
      description:
          "Flipping the script on beauty: all about clean, glow-boosting products. Simplify your routine & amplify your confidence.",
      investedAmount: "270,000 LE",
      investors: "25",
    ),
    InvestmentItemB(
      assetImage: "assets/image (23).png",
      title: "Zero Sugar By Ketonista",
      description:
          "We are specialized in Healthy, Keto, Sugar Free, Gluten Free Products",
      investedAmount: "450,000 LE",
      investors: "43",
    ),
    InvestmentItemB(
      assetImage: "assets/image (35).png",
      title: "Seemly",
      description:
          "Seemly brings simplicity and comfort to your wardrobe. Perfect casual pieces for all your needs.",
      investedAmount: "260,000 LE",
      investors: "32",
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
    {'label': 'Deadline', 'value': '16 Oct, 2025'},
    {'label': 'Location', 'value': 'Warehouse'},
    {'label': 'Strength', 'value': 'Strong technical team'},
    {'label': 'Challenges', 'value': 'Attract customers.'},
  ];

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF003366);
    const accentRed = Color(0xFFE53935);
    const dividerColor = Color(0xFFDDDDDD);

    return Scaffold(
      backgroundColor: kScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScreenBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false, // إزالة سهم الرجوع
        titleSpacing: 16,
        title: Row(children: [
          Image.asset('assets/logo.png', width: 70, height: 70),
          const SizedBox(width: 8),
          const Text('INVESTA',
              style: TextStyle(
                  color: primaryBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ]),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active, color: primaryBlue),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // --- Trending Brands + Search
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text('Trending Brands',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Trending Brands',
                hintStyle:
                    TextStyle(color: kSearchBarHintTextColor, fontSize: 14),
                filled: true,
                fillColor: kSearchBarFillColor,
                prefixIcon: Icon(Icons.search, color: kSearchBarIconColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // --- 4 Cards
          ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) {
              final it = items[i];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: InvestmentCardB(
                  assetImage: it.assetImage,
                  title: it.title,
                  description: it.description,
                  investedAmount: it.investedAmount,
                  investors: it.investors,
                  onTap: () {},
                  onBookmarkPressed: () {},
                  isSaved: false,
                ),
              );
            },
          ),

          // --- Investors Posts
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: Text('Investors Posts',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue)),
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: investorPosts.length,
            separatorBuilder: (_, __) =>
                Divider(color: dividerColor, thickness: kCardDividerThickness),
            itemBuilder: (c, i) {
              final p = investorPosts[i];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(p['avatar']!)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p['name']!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: primaryBlue)),
                                const SizedBox(height: 4),
                                Text(p['subtitle']!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: primaryBlue)),
                              ]),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      Text(p['content']!),
                    ]),
              );
            },
          ),

          // --- Latest Discussions
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: Text('Latest Discussions',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('What is the best sectors to invest in 2025?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: accentRed)),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: discussionReplies.length,
            separatorBuilder: (_, __) =>
                Divider(color: dividerColor, thickness: kCardDividerThickness),
            itemBuilder: (c, i) {
              final p = discussionReplies[i];
              final isOmar = p['name'] == 'Omar Saad';
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: isOmar ? 32.0 : 16.0, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(p['avatar']!)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p['name']!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: primaryBlue)),
                                const SizedBox(height: 4),
                                Text(p['subtitle']!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: primaryBlue)),
                              ]),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      Text(p['content']!),
                    ]),
              );
            },
          ),

          // --- Investment Opportunities + Metrics
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: Text('Investment Opportunities',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InvestmentCardB(
              assetImage: 'assets/opportunity.png',
              title: 'Zero Sugar By Ketonista',
              description:
                  'We are specialized in Healthy, Keto, Sugar Free, Gluten Free Products',
              investedAmount: '450,000 LE',
              investors: '43',
              onTap: () {},
              onBookmarkPressed: () {},
              isSaved: false,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: opportunityMetrics.asMap().entries.map((e) {
                final idx = e.key;
                final m = e.value;
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(children: [
                      Expanded(
                          child: Text(m['label']!,
                              style: const TextStyle(color: kMetricTextColor))),
                      Text(m['value']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMetricTextColor)),
                    ]),
                  ),
                  if (idx != opportunityMetrics.length - 1)
                    const Divider(
                        thickness: kMetricsDividerThickness,
                        color: dividerColor),
                ]);
              }).toList(),
            ),
          ),

          // --- See more
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD9E4FF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Community2Screen()),
                  );
                },
                child:
                    Text('See more', style: TextStyle(color: kMetricTextColor)),
              ),
            ]),
          ),

          const SizedBox(height: 16),

          // --- Invest button
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Invest'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kInvestBtnColor,
                foregroundColor: kInvestBtnTextColor,
                fixedSize: const Size(kInvestBtnWidth, kInvestBtnHeight),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ]),
      ),
    );
  }
}
