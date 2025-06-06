import 'package:first_page/investment_item.dart';
import 'package:flutter/material.dart';
// Removed: Duplicate InvestmentItem definition from here
// Make sure InvestmentItem is defined ONLY in 'package:helloworld/investment_item.dart'

// Still needed if you intend to use API in the future
// Still needed if you intend to use JSON conversion in the future

/// ————————————————————————————
///  Fixed values for easy modification ↓
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
///  End of editable values
/// ————————————————————————————

// InvestmentCardB class (assuming it's intentionally separate from InvestmentCard, though generally one is preferred)
class InvestmentCardB extends StatelessWidget {
  final String assetImage, title, description, investedAmount, investors;
  final VoidCallback onTap, onBookmarkPressed;
  final bool isSaved;

  const InvestmentCardB({
    super.key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
    required this.onTap,
    required this.onBookmarkPressed,
    required this.isSaved,
  });

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
                Image.asset(
                  assetImage,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black45)],
                      ),
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
                            color: Color(0xFF082347),
                          ),
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
                      Text(
                        investedAmount,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'invested',
                        style: TextStyle(fontSize: 12, color: kMetricTextColor),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        investors,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'investors',
                        style: TextStyle(fontSize: 12, color: kMetricTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Community2Screen with FAKHR details
class Community2Screen extends StatefulWidget {
  const Community2Screen({super.key});

  @override
  State<Community2Screen> createState() => _Community2ScreenState();
}

class _Community2ScreenState extends State<Community2Screen> {
  InvestmentItem? selected;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  // IMPORTANT FIX: Added the 'category' field to each InvestmentItem.
  // Ensure these categories match the exact strings used in HomeScreen
  // and in your InvestmentItem.fromJson method if you're fetching from API.
  final List<InvestmentItem> allItems = [
    InvestmentItem(
      assetImage: "assets/image (36).png",
      title: "FAKHR",
      description:
          "Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness.",
      investedAmount: "300,000 LE",
      investors: "33",
      category: "Fashion", // Assumed category based on common sense
    ),
    InvestmentItem(
      assetImage: "assets/image (56).png",
      title: "Mother Naked",
      description:
          "Flipping the script on beauty: all about clean, glow-boosting products.",
      investedAmount: "270,000 LE",
      investors: "25",
      category: "Beauty", // Assumed category
    ),
    InvestmentItem(
      assetImage: "assets/image (23).png",
      title: "Zero Sugar By Ketonista",
      description:
          "We are specialized in Healthy, Keto, Sugar Free, Gluten Free Products",
      investedAmount: "450,000 LE",
      investors: "43",
      category: "Food & Beverage", // Assumed category
    ),
    InvestmentItem(
      assetImage: "assets/image (35).png",
      title: "Seemly",
      description: "Seemly brings simplicity and comfort to your wardrobe.",
      investedAmount: "260,000 LE",
      investors: "32",
      category: "Fashion", // Assumed category
    ),
    InvestmentItem(
      assetImage: "assets/image (40).png",
      title: "Beyond",
      description: "Empowering individuals through innovative tech solutions.",
      investedAmount: "320,000 LE",
      investors: "30",
      category:
          "Technology", // Assumed category (if not in your list, pick an existing one)
    ),
    InvestmentItem(
      assetImage: "assets/image (22).png",
      title: "Infuse",
      description: "Revolutionizing aromatherapy with cutting-edge blends.",
      investedAmount: "280,000 LE",
      investors: "27",
      category: "Health & Fitness", // Assumed category
    ),
    InvestmentItem(
      assetImage: "assets/image (30).png",
      title: "Eros",
      description: "Bringing artisanal coffee experiences to your doorstep.",
      investedAmount: "500,000 LE",
      investors: "45",
      category: "Food & Beverage", // Assumed category
    ),
  ];

  final List<Map<String, String>> fakhrMetrics = [
    {'label': 'Funding Goal', 'value': '500,000 L.E - 850,000 L.E'},
    {'label': 'Completed Funding', 'value': '330,000 L.E'},
    {'label': 'Expected Success Rate', 'value': '97%'},
    {'label': 'Investment State', 'value': 'Short - Long'},
    {'label': 'Minimum investment', 'value': '7,000 L.E'},
    {'label': 'Maximum investment', 'value': '55,000 L.E'},
    {'label': 'Minimum Short term', 'value': '7,000 L.E'},
    {'label': 'Minimum Long term', 'value': '36,000 L.E'},
    {'label': 'Deadline', 'value': '16 Oct, 2025'},
    {'label': 'Store Type', 'value': 'Warehouse - Physical Store'},
    {'label': 'Location', 'value': 'New Cairo - Nasr City'},
    {'label': 'Website', 'value': 'zerosugarbyketonista.com'},
    {'label': 'Social', 'value': 'f'},
  ];

  final List<Map<String, String>> topInvestors = [
    {
      'avatar': 'assets/khalil.png',
      'name': 'Ahmed Tarek Khalil',
      'subtitle': 'ROI - 120% '
    },
    {
      'avatar': 'assets/Mohamed.png',
      'name': 'Mohammed Farouq',
      'subtitle': 'ROI - 100% '
    },
  ];

  final List<Map<String, String>> discussion = [
    {
      'avatar': 'assets/fady.png',
      'name': 'Aly Fady',
      'subtitle': 'invested in Zerosugar / Fakhr',
      'content': 'Do you have a physical store or do you only sell online?'
    },
    {
      'avatar': 'assets/DR (2).png',
      'name': 'Dr.Mohammed Essam',
      'subtitle': 'Founder of Zerosugar with ketonista',
      'content':
          'Replied on Aly : We are currently relying on online and we have to physical store, and we are planning to open a store in Maadi and Zayed soon.'
    },
    {
      'avatar': 'assets/Ahmed.png',
      'name': 'Omar Ameer',
      'subtitle': 'invested in Seemly / Zero sugar by ketonista',
      'content': 'What is the expected profit margin during this year?'
    },
    {
      'avatar': 'assets/Dr.png',
      'name': 'Dr. Norhan Salah',
      'subtitle': 'Founder of Zerosugar with ketonista',
      'content':
          'Replied on Omar : We expect a profit margin of up to 92% due to high demand.'
    },
  ];

  final List<Map<String, String>> investorPosts = [
    {
      'avatar': 'assets/Ahmed.png',
      'name': 'Ahmad Ali ',
      'subtitle': 'invested in FAKHR / Seemly',
      'content':
          'Investing here is going to be the better decision to help the children’s in school and all types of people to change the concept of the healthy food ,it’s gonna be a global company very soon .',
    },
    {
      'avatar': 'assets/Rana.png',
      'name': 'Rana Atef',
      'subtitle': 'invested in matter / Beyond',
      'content':
          'Investing here is going to be the better decision to help the children’s in school and all types of people to change the concept of the healthy food ,it’s gonna be a global company very soon ',
    },
    {
      'avatar': 'assets/omar.png',
      'name': 'Omar Saad',
      'subtitle': 'invested in Infuse / eros',
      'content':
          'Investing here is going to be the better decision to help the children’s in school and all types of people to change the concept of the healthy food ,it’s gonna be a global company very soon ',
    },
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

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF003366);
    const Color dividerColor = Color(0xFFDDDDDD);

    // Filter items based on search query (local filtering)
    final filteredItems = allItems
        .where((item) => item.title.toLowerCase().contains(_searchQuery))
        .toList();

    if (selected == null) {
      return Scaffold(
        backgroundColor: kScreenBackgroundColor,
        appBar: AppBar(
          backgroundColor: kScreenBackgroundColor,
          elevation: 0,
          leading: const BackButton(color: primaryBlue),
          title: const Text(
            'Community ',
            style: TextStyle(
              color: primaryBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Trending Brands',
                    hintStyle: const TextStyle(
                        color: kSearchBarHintTextColor, fontSize: 14),
                    filled: true,
                    fillColor: kSearchBarFillColor,
                    prefixIcon:
                        const Icon(Icons.search, color: kSearchBarIconColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // List of cards (filtered locally)
              ListView.builder(
                itemCount: filteredItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (c, i) {
                  final it = filteredItems[i];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: InvestmentCardB(
                      // Assuming InvestmentCardB is the desired card here
                      assetImage: it.assetImage,
                      title: it.title,
                      description: it.description,
                      investedAmount: it.investedAmount,
                      investors: it.investors,
                      onTap: () {
                        // This logic needs to be updated if you want to navigate
                        // to a dynamic project details page based on the tapped item.
                        // For now, it only navigates to FAKHR if 'FAKHR' is tapped.
                        if (it.title == 'FAKHR') {
                          setState(() => selected = it);
                        } else {
                          // Handle tapping on other items, e.g., navigate to a generic details page
                          print('Tapped on ${it.title} in Community List');
                        }
                      },
                      onBookmarkPressed: () {
                        // Implement bookmark toggle if this screen needs it
                        print(
                            'Bookmark pressed for ${it.title} in Community List');
                      },
                      isSaved:
                          false, // You might need to fetch saved state for these items
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // This button doesn't have a specific function in the current UI
                    print('Invest button pressed on Community List');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kInvestBtnColor,
                    foregroundColor: kInvestBtnTextColor,
                    fixedSize: const Size(kInvestBtnWidth, kInvestBtnHeight),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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

    // Detailed FAKHR view (This part is hardcoded to 'FAKHR' details)
    return Scaffold(
      backgroundColor: kScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScreenBackgroundColor,
        elevation: 0,
        leading: BackButton(
          color: primaryBlue,
          onPressed: () =>
              setState(() => selected = null), // Go back to community list
        ),
        title: const Text(
          'FAKHR', // Hardcoded title for FAKHR details page
          style: TextStyle(
            color: primaryBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover + overlay
            Stack(
              children: [
                Image.asset(
                  selected!.assetImage,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                const Positioned.fill(
                  child: Center(
                    child: Text(
                      'FAKHR', // Hardcoded overlay text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black45)],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),

            // Metrics table
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: fakhrMetrics.asMap().entries.map((e) {
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
                                style:
                                    const TextStyle(color: Color(0xff001F3F)),
                              ),
                            ),
                            Text(m['value']!),
                          ],
                        ),
                      ),
                      if (idx != fakhrMetrics.length - 1)
                        const Divider(
                          thickness: 1,
                          color: Color(0xff001F3F),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),
            // Top investors
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Top investors in FAKHR',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: topInvestors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (c, i) {
                final p = topInvestors[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
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
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryBlue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              p['subtitle']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: primaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            // Discussion: no dividers, with indentation for doctor names
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Discussion',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: discussion.length,
              itemBuilder: (c, i) {
                final p = discussion[i];
                final isDoctor = p['name']!.startsWith('Dr.');
                final leftPad = isDoctor ? 32.0 : 16.0;
                return Padding(
                  padding: EdgeInsets.fromLTRB(leftPad, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 17.5,
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

            const SizedBox(height: 24),
            // Investors Posts
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
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
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: investorPosts.length,
              separatorBuilder: (_, __) => const Divider(
                  color: dividerColor, thickness: kCardDividerThickness),
              itemBuilder: (c, i) {
                final p = investorPosts[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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

            const SizedBox(height: 24),
            // Latest Discussions
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Latest Discussions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: latestDiscussions.length,
              separatorBuilder: (_, __) => const Divider(
                  color: dividerColor, thickness: kCardDividerThickness),
              itemBuilder: (c, i) {
                final p = latestDiscussions[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Invest button pressed on FAKHR details page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kInvestBtnColor,
                  foregroundColor: kInvestBtnTextColor,
                  fixedSize: const Size(kInvestBtnWidth, kInvestBtnHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
