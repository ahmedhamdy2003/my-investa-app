import 'package:first_page/saved_screenB.dart';
import 'package:flutter/material.dart';
import 'investment_itemB.dart';
import 'investment_cardB.dart';

/// Mixin to define common UI for category pages.
mixin CategoryPageMixin<T extends StatefulWidget> on State<T> {
  String? selectedFilter;
  String? selectedSortOption;

  /// Build the search bar (same as in Home)
  Widget buildSearchBar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xffF5F7FA),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for a Business or Founder name",
          hintStyle: TextStyle(color: Color(0xFF7E9ACF), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF7E9ACF)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// Build Filter Bar (same for all categories)
  Widget buildFilterBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildFilterButton(Icons.swap_vert, "Sort by", true),
            buildFilterButton(null, "Top Raised"),
            buildFilterButton(null, "Closing soon"),
            buildFilterButton(null, "Viral"),
          ],
        ),
        SizedBox(height: 16),
        Divider(color: Colors.black, thickness: 1, height: 20),
      ],
    );
  }

  Widget buildFilterButton(IconData? icon, String label,
      [bool isSortBy = false]) {
    bool isSelected = (selectedFilter == label);
    return GestureDetector(
      onTap: () {
        if (isSortBy) {
          showSortByBottomSheet();
        } else {
          setState(() {
            selectedFilter = (selectedFilter == label) ? null : label;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff082347) : Colors.transparent,
          border: Border.all(color: Color(0xff082347)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 16, color: Color(0xff082347)),
            if (icon != null) SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            if (isSortBy) Icon(Icons.arrow_drop_down, color: Color(0xff082347)),
          ],
        ),
      ),
    );
  }

  void showSortByBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Type of your investing",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 6),
              Text("How would you like to invest, and get your return?",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 16),
              buildSortOption("Long Term"),
              buildSortOption("Short Term"),
            ],
          ),
        );
      },
    );
  }

  Widget buildSortOption(String option) {
    bool isSelected = (option == selectedSortOption);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption = (selectedSortOption == option) ? null : option;
        });
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff082347) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff082347)),
        ),
        child: Center(
          child: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xff082347),
            ),
          ),
        ),
      ),
    );
  }

  /// Build vertical list of Investment Cards.
  Widget buildVerticalList(
    List<InvestmentItemB> data, {
    required void Function(InvestmentItemB item) onBookmarkPressedCallback,
  }) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = data[index];
        // لاحقاً سنضيف منطق الحفظ (isItemSaved)
        final isSaved = isItemSaved(item);
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: InvestmentCardB(
            assetImage: item.assetImage,
            title: item.title,
            description: item.description,
            investedAmount: item.investedAmount,
            investors: item.investors,
            isSaved: isSaved,
            onBookmarkPressed: () => onBookmarkPressedCallback(item),
          ),
        );
      },
    );
  }

  /// يجب على كل صفحة أن تعرّف هل العنصر محفوظ أم لا
  bool isItemSaved(InvestmentItemB item);
}

/// =================== Health & Fitness Page ===================
class HealthFitnessPage extends StatefulWidget {
  const HealthFitnessPage({Key? key}) : super(key: key);

  @override
  _HealthFitnessPageState createState() => _HealthFitnessPageState();
}

class _HealthFitnessPageState extends State<HealthFitnessPage>
    with CategoryPageMixin {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (21).png",
      title: " iDiet",
      description:
          "offering healthy, satisfying meals to support effortless weight loss",
      investedAmount: "260,000 LE ",
      investors: "26",
    ),
    InvestmentItemB(
      assetImage: "assets/image (22).png",
      title: "MuscleAdd",
      description:
          "leading supplement manufacturing company, we serve millions of athletes around world to create better healthy future by improving lifestyle.",
      investedAmount: "205,000 LE ",
      investors: "20",
    ),
    InvestmentItemB(
      assetImage: "assets/image (23).png",
      title: "Zero Sugar By Ketonista",
      description:
          "   We are specialized in Healthy , Keto , Sugar Free , Gluten Free Products",
      investedAmount: "450,000 LE ",
      investors: "43",
    ),
    InvestmentItemB(
      assetImage: "assets/image (24).png",
      title: " Muscle Seeds",
      description:
          "Our mission is to provide premium supplements that support and enhance the fitness journey of individual, as a lifestyle take it as their profession",
      investedAmount: "205,000 LE",
      investors: "30",
    ),
    InvestmentItemB(
      assetImage: "assets/image (25).png",
      title: " Muscle Seeds",
      description:
          "Our mission is to provide premium supplements that support and enhance the fitness journey of individual, as a lifestyle take it as their profession",
      investedAmount: "220,000 LE ",
      investors: "23",
    ),
    InvestmentItemB(
      assetImage: "assets/image (26).png",
      title: "INFUSE",
      description:
          "For fitness wear that are Infusing Quality, Affordability, and Style into Every Thread!",
      investedAmount: "350,000 LE",
      investors: "35",
    ),
    InvestmentItemB(
      assetImage: "assets/image (27).png",
      title: "Eat Healthy",
      description: "Meal plans for a healthier lifestyle",
      investedAmount: "260,000 LE",
      investors: "26",
    ),
  ];

  // قائمة محلية للعناصر المحفوظة
  List<InvestmentItemB> savedItems = [];

  @override
  bool isItemSaved(InvestmentItemB item) {
    return savedItems.any((elem) => elem.title == item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar مع زر رجوع + أيقونة الحفظ
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Health & Fitness",
            style: TextStyle(
                color: Color(0xff082347),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              Divider(color: Colors.black, thickness: 1, height: 20),
              buildFilterBar(),
              SizedBox(height: 16),
              Container(
                color: Color(0xffD9E4FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    buildVerticalList(items, onBookmarkPressedCallback: (item) {
                  setState(() {
                    // إذا كان محفوظاً => إزالة، والعكس صحيح
                    if (isItemSaved(item)) {
                      savedItems
                          .removeWhere((elem) => elem.title == item.title);
                    } else {
                      savedItems.add(item);
                    }
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =================== Food Truck Page ===================
class FoodTruckPage extends StatefulWidget {
  const FoodTruckPage({Key? key}) : super(key: key);

  @override
  _FoodTruckPageState createState() => _FoodTruckPageState();
}

class _FoodTruckPageState extends State<FoodTruckPage> with CategoryPageMixin {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (28).png",
      title: "The BOBA Truck ",
      description:
          "Sip, Smile, and Repeat OUR BOBA drinks in📍Offshell Walk, Seashell",
      investedAmount: "430,000 LE ",
      investors: "35",
    ),
    InvestmentItemB(
      assetImage: "assets/image (29).png",
      title: "Matter",
      description:
          "  Post-modern Matcha & Brew House.All things Matcha🍵 Ceremonial Grade Matcha",
      investedAmount: "350,000 LE ",
      investors: "35",
    ),
    InvestmentItemB(
      assetImage: "assets/image (30).png",
      title: "El Santo",
      description:
          "  We don't mind getting our hands dirty with…. Tacos 🌮Just come AND TRT OUR SPECIAL TACOS",
      investedAmount: "250,000 LE ",
      investors: "29",
    ),
    InvestmentItemB(
      assetImage: "assets/image (31).png",
      title: "LOU",
      description:
          "  Specialized in Bang burger / Mac n cheese burger / Crispy Chicken / Fresh onion B / BBQ B / Hot dog / Mexican nachos chips  ",
      investedAmount: "190,000 LE ",
      investors: "20",
    ),
    InvestmentItemB(
      assetImage: "assets/image (32).png",
      title: "Burgerista",
      description:
          "   A gourmet burger spot serving juicy, handcrafted burgers with bold flavors and fresh ingredients!",
      investedAmount: "230,000 LE ",
      investors: "25",
    ),
    InvestmentItemB(
      assetImage: "assets/image (33).png",
      title: "The pizza Truck",
      description:
          "Special Margarita / pepperoni / Salami / Anchovies / Pesto Buffalo / Truffle Fungi / Vegetarian / Caprese for sweet nutella / Lotus     ",
      investedAmount: "220,000 LE ",
      investors: "30",
    ),
    InvestmentItemB(
      assetImage: "assets/image (34).png",
      title: "Waffleyano",
      description:
          " A musical-themed food truck serving delicious waffles, pancakes, and sweet treats with a creative twist!",
      investedAmount: "150,000 LE ",
      investors: "15",
    ),
  ];

  List<InvestmentItemB> savedItems = [];

  @override
  bool isItemSaved(InvestmentItemB item) {
    return savedItems.any((elem) => elem.title == item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar مع زر رجوع + أيقونة الحفظ
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Color(0xff082347)),
            onPressed: () {
              // صفحة الحفظ
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScreenB(savedItems: savedItems),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Food Truck",
            style: TextStyle(
                color: Color(0xff082347),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              Divider(color: Colors.black, thickness: 1, height: 20),
              buildFilterBar(),
              SizedBox(height: 16),
              Container(
                color: Color(0xffD9E4FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    buildVerticalList(items, onBookmarkPressedCallback: (item) {
                  setState(() {
                    if (isItemSaved(item)) {
                      savedItems
                          .removeWhere((elem) => elem.title == item.title);
                    } else {
                      savedItems.add(item);
                    }
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =================== Fashion Page ===================
class FashionPage extends StatefulWidget {
  const FashionPage({Key? key}) : super(key: key);

  @override
  _FashionPageState createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> with CategoryPageMixin {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (35).png",
      title: "Seemly",
      description:
          " Seemly brings simplicity and comfort to your wardrobe. Our products are designed with you in stylish, casual, and perfect for all of your needs.",
      investedAmount: "260,000 LE ",
      investors: "32",
    ),
    InvestmentItemB(
      assetImage: "assets/image (36).png",
      title: "FAKHR",
      description:
          " Our mission is to inspire and empower individuals to embrace their unique journey, celebrate their achievements, and strive for greatness. ",
      investedAmount: "300,000 LE ",
      investors: "33",
    ),
    InvestmentItemB(
      assetImage: "assets/image (37).png",
      title: "Urban Ducks",
      description:
          "Using hibiscus rice, green tea & orange, its products can be found in pharmacy Bloom Egypt, & on several online platforms Source Beauty.",
      investedAmount: "240,000 LE ",
      investors: "36",
    ),
    InvestmentItemB(
      assetImage: "assets/image (39).png",
      title: "Beyond",
      description:
          "   Egyptian with high quality garments with reasonable prices,Beyond ,all stereotypes ,Misconception ,Expectations that comes to mind   ",
      investedAmount: "250,000 LE ",
      investors: "28",
    ),
    InvestmentItemB(
      assetImage: "assets/image (40).png",
      title: " Eros",
      description: "LOVE IS A DEADLY SPELL",
      investedAmount: "230,000 LE",
      investors: "25",
    ),
    InvestmentItemB(
      assetImage: "assets/image (40).png",
      title: " Glitch ",
      description:
          " Glitch was founded on passion and we pride ourselves on radical design that unabashedly pushes you outside your comfort zone. ",
      investedAmount: "150,000 LE ",
      investors: "22",
    ),
    InvestmentItemB(
      assetImage: "assets/image (41).png",
      title: "Fashion 7",
      description:
          "    our customers satisfaction is our priority , worldwide shipping ,always connected with our family(customers) ",
      investedAmount: "220,000 LE  ",
      investors: "30",
    ),
  ];

  List<InvestmentItemB> savedItems = [];

  @override
  bool isItemSaved(InvestmentItemB item) {
    return savedItems.any((elem) => elem.title == item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar مع زر رجوع + أيقونة الحفظ
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Color(0xff082347)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScreenB(savedItems: savedItems),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Fashion",
            style: TextStyle(
                color: Color(0xff082347),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              Divider(color: Colors.black, thickness: 1, height: 20),
              buildFilterBar(),
              SizedBox(height: 16),
              Container(
                color: Color(0xffD9E4FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    buildVerticalList(items, onBookmarkPressedCallback: (item) {
                  setState(() {
                    if (isItemSaved(item)) {
                      savedItems
                          .removeWhere((elem) => elem.title == item.title);
                    } else {
                      savedItems.add(item);
                    }
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =================== Beauty Page ===================
class BeautyPage extends StatefulWidget {
  const BeautyPage({Key? key}) : super(key: key);

  @override
  _BeautyPageState createState() => _BeautyPageState();
}

class _BeautyPageState extends State<BeautyPage> with CategoryPageMixin {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (42).png",
      title: "Smack That Scrub ",
      description:
          " The brand’s scrubs are the show-stoppers, though, as they target cellulite, eczema, flaky skins, and variousother skin ailments.",
      investedAmount: "200,000 LE ",
      investors: "32",
    ),
    InvestmentItemB(
      assetImage: "assets/image (43).png",
      title: "Urban Ducks",
      description:
          "Using hibiscus rice, green tea & orange, its products can be found in pharmacy Bloom Egypt, & on several online platforms Source Beauty.",
      investedAmount: "150,000 LE ",
      investors: "15",
    ),
    InvestmentItemB(
      assetImage: "assets/image (44).png",
      title: "Clementine",
      description:
          " Clean, and cruelty-free skincare products that bring the perfect mix between health and beauty.",
      investedAmount: "250,000 LE ",
      investors: "36",
    ),
    InvestmentItemB(
      assetImage: "assets/image (46).png",
      title: "The Bathland",
      description:
          "   Collection has everything you need to have naturally glowing skin. From face scrubs to lip & cheek tint, we've got you covered!",
      investedAmount: "140,000 LE ",
      investors: "15",
    ),
    InvestmentItemB(
      assetImage: "assets/image (56).png",
      title: " Mother Naked",
      description:
          ".  flipping the script on beauty , all about clean, glow-boosting.products simplify your routine & amplify your confidence. Designed to match",
      investedAmount: "270,000 LE ",
      investors: "25",
    ),
    InvestmentItemB(
      assetImage: "assets/image (47).png",
      title: "Glazed",
      description:
          ".  Offering monthly subscription boxes . Our connection with our customers is strong since without it loyal customers brands mean nothing",
      investedAmount: "150,000 LE  ",
      investors: "22",
    ),
    InvestmentItemB(
      assetImage: "assets/image (48).png",
      title: "Meraki",
      description:
          " It provides a diversity of natural products for personal care, catering to skin, hair and wellbeing.",
      investedAmount: "250,000 LE ",
      investors: "27",
    ),
  ];

  List<InvestmentItemB> savedItems = [];

  @override
  bool isItemSaved(InvestmentItemB item) {
    return savedItems.any((elem) => elem.title == item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar مع زر رجوع + أيقونة الحفظ
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Color(0xff082347)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScreenB(savedItems: savedItems),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Beauty",
            style: TextStyle(
                color: Color(0xff082347),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              Divider(color: Colors.black, thickness: 1, height: 20),
              buildFilterBar(),
              SizedBox(height: 16),
              Container(
                color: Color(0xffD9E4FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    buildVerticalList(items, onBookmarkPressedCallback: (item) {
                  setState(() {
                    if (isItemSaved(item)) {
                      savedItems
                          .removeWhere((elem) => elem.title == item.title);
                    } else {
                      savedItems.add(item);
                    }
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =================== Food & Beverage Page ===================
class FoodAndBeveragePage extends StatefulWidget {
  const FoodAndBeveragePage({Key? key}) : super(key: key);

  @override
  _FoodAndBeveragePageState createState() => _FoodAndBeveragePageState();
}

class _FoodAndBeveragePageState extends State<FoodAndBeveragePage>
    with CategoryPageMixin {
  final List<InvestmentItemB> items = [
    InvestmentItemB(
      assetImage: "assets/image (49).png",
      title: " Goovy ",
      description:
          " A Cairo-based restaurant specializing in smash burgers and crispy fried chicken, known for its bold flavors and high-quality ingredients.",
      investedAmount: "200,000 LE ",
      investors: "32",
    ),
    InvestmentItemB(
      assetImage: "assets/image (50).png",
      title: " Mesh Beta3 Aseer",
      description:
          ".  A juice shop ,  offering fresh juices and smoothies made with 100% natural ingredients.",
      investedAmount: "150,000 LE ",
      investors: "15",
    ),
    InvestmentItemB(
      assetImage: "assets/image (51).png",
      title: "Waffle Station",
      description:
          " Fresh waffles, customizable toppings, sweet & savory delights!",
      investedAmount: "240,000 LE ",
      investors: "36",
    ),
    InvestmentItemB(
      assetImage: "assets/image (52).png",
      title: "Matros Ali w Dos ",
      description:
          "   An Egyptian eatery known for its creative sweet and savory sandwiches, packed with rich flavors and unique ingredients.",
      investedAmount: "300,000 LE ",
      investors: "33",
    ),
    InvestmentItemB(
      assetImage: "assets/image (54).png",
      title: " Mother Naked",
      description:
          ".  flipping the script on beauty , all about clean, glow-boosting.products simplify your routine & amplify your confidence. Designed to match",
      investedAmount: "280,000 LE ",
      investors: "27",
    ),
    InvestmentItemB(
      assetImage: "assets/image (54).png",
      title: " Zooba",
      description:
          ".  serves modern Egyptian street food with authentic flavors and a creative twist. We have are in Kuwait NOW ! ",
      investedAmount: "150,000 LE ",
      investors: "22",
    ),
    InvestmentItemB(
      assetImage: "assets/image (55).png",
      title: " Azouma Marakbeya",
      description:
          " An Egyptian seafood restaurant , known for its fresh fish dishes and flavorful seafood specialties.",
      investedAmount: "290,000 LE ",
      investors: "30",
    ),
  ];

  List<InvestmentItemB> savedItems = [];

  @override
  bool isItemSaved(InvestmentItemB item) {
    return savedItems.any((elem) => elem.title == item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar مع زر رجوع + أيقونة الحفظ
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff082347)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: Color(0xff082347)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScreenB(savedItems: savedItems),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Food & Beverage",
            style: TextStyle(
                color: Color(0xff082347),
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              SizedBox(height: 16),
              Divider(color: Colors.black, thickness: 1, height: 20),
              buildFilterBar(),
              SizedBox(height: 16),
              Container(
                color: Color(0xffD9E4FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                child:
                    buildVerticalList(items, onBookmarkPressedCallback: (item) {
                  setState(() {
                    if (isItemSaved(item)) {
                      savedItems
                          .removeWhere((elem) => elem.title == item.title);
                    } else {
                      savedItems.add(item);
                    }
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
