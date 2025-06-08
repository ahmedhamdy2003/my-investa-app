// home_screen.dart

import 'package:investa4/nasar/categories_pages.dart';
import 'package:investa4/nasar/community_screen.dart';
import 'package:investa4/nasar/dashboard_screen.dart';
import 'package:investa4/nasar/investment_card.dart';
import 'package:investa4/nasar/investment_item.dart';
import 'package:investa4/nasar/profile_screen.dart';
import 'package:investa4/nasar/reels_screen.dart';
import 'package:investa4/nasar/save_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool showFilterBar = false;
  String? selectedFilter;
  String? selectedSortOption;

  // NEW: Default profile image is now an empty string or a generic network URL
  // instead of a local asset path, as the image will come from the backend.
  String _userName = 'Guest';
  String _userProfileImage = ''; // Changed default to empty string

  List<InvestmentItem> allProjects = [];
  List<InvestmentItem> _savedItems = [];
  List<InvestmentItem> searchResults = [];

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  static const String _baseUrl = 'https://aed7-102-190-139-157.ngrok-free.app/';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _fetchHomeData();
    _fetchSavedItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Function to fetch user data (name and profile image) from API
  Future<void> _fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('${_baseUrl}welcome/'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          _userName = data['name'] ?? 'Younis';
          // Ensure 'profile_image_url' is the exact key from your backend's JSON response
          _userProfileImage =
              data['profile_image_url'] ?? ''; // Default to empty if not found
        });
      } else {
        print("Failed to load user data: ${response.statusCode}");
        setState(() {
          _userProfileImage = ''; // Clear image on failure
          _userName = 'Error'; // Indicate error
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        _userProfileImage = ''; // Clear image on error
        _userName = 'Error'; // Indicate error
      });
    }
  }

  /// Function to fetch project data for all sections and combine them
  Future<void> _fetchHomeData() async {
    try {
      List<InvestmentItem> interests = await _fetchProjectSection(
        '${_baseUrl}interest-projects/',
      );
      List<InvestmentItem> topRaised = await _fetchProjectSection(
        '${_baseUrl}top-raised/',
      );
      List<InvestmentItem> closingSoon = await _fetchProjectSection(
        '${_baseUrl}closing-soon/',
      );
      List<InvestmentItem> trending = await _fetchProjectSection(
        '${_baseUrl}trending/',
      );

      setState(() {
        allProjects = [...interests, ...topRaised, ...closingSoon, ...trending];
        // Optional: Remove duplicates if the same project appears in multiple sections.
        // import 'dart:collection';
        // allProjects = LinkedHashSet<InvestmentItem>.from(allProjects).toList();
      });
    } catch (e) {
      print("Error fetching home data: $e");
      // Handle error, maybe show a message to the user
    }
  }

  /// Helper function to fetch a single project section
  Future<List<InvestmentItem>> _fetchProjectSection(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((json) => InvestmentItem.fromJson(json))
          .cast<InvestmentItem>()
          .toList();
    } else {
      throw Exception(
        'Failed to load projects from $url: ${response.statusCode}',
      );
    }
  }

  /// Function to search projects from API (this remains the same as it searches globally)
  Future<void> _searchProjects(String query) async {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        searchResults = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    try {
      final response = await http.get(Uri.parse('${_baseUrl}search/?q=$query'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          searchResults =
              data
                  .map((json) => InvestmentItem.fromJson(json))
                  .cast<InvestmentItem>()
                  .toList();
        });
      } else {
        print("Failed to search projects: ${response.statusCode}");
        setState(() {
          searchResults = [];
        });
      }
    } catch (e) {
      print("Error searching projects: $e");
      setState(() {
        searchResults = [];
      });
    }
  }

  /// Function to fetch saved projects from API
  /// NOTE: Assumes the backend still uses 'user/saved_projects/' endpoint for saved items.
  Future<void> _fetchSavedItems() async {
    try {
      final response = await http.get(
        Uri.parse('${_baseUrl}user/saved_projects/'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _savedItems =
              data
                  .map((json) => InvestmentItem.fromJson(json))
                  .cast<InvestmentItem>()
                  .toList();
        });
      } else {
        print("Failed to load saved items: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching saved items: $e");
    }
  }

  /// Function to add/remove a project from saved items via API
  /// NOTE: Assumes the backend still uses 'user/toggle_saved_project/' endpoint.
  Future<void> _toggleBookmark(InvestmentItem item) async {
    final bool isCurrentlySaved = _savedItems.any(
      (savedItem) => savedItem.title == item.title,
    ); // Prefer using item.id if available
    final String action = isCurrentlySaved ? 'remove' : 'add';

    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}user/toggle_saved_project/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN',
        },
        body: jsonEncode({
          'project_id':
              item.title, // Prefer sending actual project ID instead of title
          'action': action,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Bookmark toggled successfully for: ${item.title}");
        _fetchSavedItems(); // Refresh saved items list after change
      } else {
        print("Failed to toggle bookmark: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Failed to save/unsave project. Status: ${response.statusCode}",
            ),
          ),
        );
      }
    } catch (e) {
      print("Error toggling bookmark: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Network error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    switch (_selectedIndex) {
      case 1:
        body = const CommunityScreen();
        break;
      case 2:
        body = const ReelsScreen();
        break;
      case 3:
        body = const DashboardScreen();
        break;
      case 4:
        body = const ProfileScreen();
        break;
      default:
        body = _buildHomeContent();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF082347)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF082347),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: _ReelsIcon(), label: 'Reels'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<void>(
            future: _fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a small circular progress indicator while loading profile data
                return const SizedBox(
                  width: 56, // Same as CircleAvatar radius * 2
                  height: 56,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Show a default profile image or an error icon
                return CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.error, color: Colors.red),
                );
              } else {
                return _buildProfileHeader();
              }
            },
          ),
          const Divider(height: 32),
          _buildSearchBar(),
          const SizedBox(height: 16),
          // Conditional display based on search mode
          _isSearching && _searchController.text.isNotEmpty
              ? FutureBuilder<void>(
                future: _searchProjects(_searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      searchResults.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error searching projects: ${snapshot.error}',
                      ),
                    );
                  } else if (searchResults.isEmpty &&
                      _searchController.text.isNotEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "No results found for your search.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  } else {
                    return _buildInvestmentList(searchResults);
                  }
                },
              )
              : FutureBuilder<void>(
                future: _fetchHomeData(), // This populates allProjects
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      allProjects.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error loading home data: ${snapshot.error}'),
                    );
                  } else {
                    return Column(
                      children: [
                        _buildCategorySectionWithDivider(),
                        _buildSectionTitle('Your Interests'),
                        _buildInvestmentSection(
                          allProjects
                              .where(
                                (item) => item.category == 'Your Interests',
                              )
                              .toList(),
                        ),
                        const Divider(height: 32),
                        _buildSectionTitle('Top Raised'),
                        _buildInvestmentSection(
                          allProjects
                              .where((item) => item.category == 'Top Raised')
                              .toList(),
                        ),
                        const Divider(height: 32),
                        _buildSectionTitle('Closing Soon'),
                        _buildInvestmentSection(
                          allProjects
                              .where((item) => item.category == 'Closing Soon')
                              .toList(),
                        ),
                        const Divider(height: 32),
                        _buildSectionTitle('Trending This Month'),
                        _buildInvestmentSection(
                          allProjects
                              .where(
                                (item) =>
                                    item.category == 'Trending This Month',
                              )
                              .toList(),
                        ),
                      ],
                    );
                  }
                },
              ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          // NEW: Always use NetworkImage for profile picture
          // If _userProfileImage is empty or invalid, display a default placeholder.
          backgroundImage:
              (_userProfileImage.isNotEmpty)
                  ? NetworkImage(_userProfileImage) as ImageProvider
                  : const AssetImage('assets/profile.png')
                      as ImageProvider, // Fallback to local asset if URL is empty/failed
          // To ensure the local 'assets/profile.png' is available, it must be in pubspec.yaml
          // and physically in your assets folder.
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Welcome, ',
                    style: TextStyle(fontSize: 24, color: Color(0xFF082347)),
                  ),
                  Text(
                    '$_userName!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF082347),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SaveScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Color(0xFF082347),
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Don\'t wait to invest. Invest and then wait.',
                style: TextStyle(fontSize: 14, color: Color(0xFF082347)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          setState(() {
            if (query.isNotEmpty) {
              _isSearching = true; // Activate search mode
              _searchProjects(
                query,
              ); // Call API for search (if not already handled by FutureBuilder)
            } else {
              _isSearching = false; // Exit search mode
              searchResults = []; // Clear search results
            }
          });
        },
        decoration: const InputDecoration(
          hintText: 'Search for a Business or Founder name',
          hintStyle: TextStyle(color: Color(0xFF7E9ACF), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF7E9ACF)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// Helper widget to display a list of investment cards (used for search and main sections)
  Widget _buildInvestmentList(List<InvestmentItem> list) {
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            "No projects found in this section.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        final isSaved = _savedItems.any(
          (s) => s.title == item.title,
        ); // Use item.id if available
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InvestmentCard(
            assetImage: item.assetImage,
            title: item.title,
            description: item.description,
            investedAmount: item.investedAmount,
            investors: item.investors,
            isSaved: isSaved,
            onBookmarkPressed: () => _toggleBookmark(item),
            onTap: () {
              print('Tapped on: ${item.title}');
              // Navigate to project details page
            },
          ),
        );
      },
    );
  }

  Widget _buildCategorySectionWithDivider() {
    return Column(
      children: [
        _buildCategorySection(),
        const SizedBox(height: 16),
        const Divider(height: 20),
      ],
    );
  }

  Widget _buildCategorySection() {
    const images = [
      'assets/Health.png',
      'assets/Food Truck.png',
      'assets/Fashion.png',
      'assets/Beauty.png',
      'assets/Food & Beverage.png',
    ];
    // Category names (these are hardcoded in Flutter)
    const categoryNames = [
      'Health & Fitness',
      'Food Truck',
      'Fashion',
      'Beauty',
      'Food & Beverage',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(images.length, (i) {
          return GestureDetector(
            onTap: () {
              // Pass the combined 'allProjects' list, saved items, and the toggle function
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    switch (i) {
                      case 0:
                        return HealthFitnessPage(
                          categoryName: categoryNames[0],
                          allProjects: allProjects,
                          savedProjectsFromHome:
                              _savedItems, // Pass saved items
                          onToggleBookmarkInHome:
                              _toggleBookmark, // Pass toggle function
                        );
                      case 1:
                        return FoodTruckPage(
                          categoryName: categoryNames[1],
                          allProjects: allProjects,
                          savedProjectsFromHome:
                              _savedItems, // Pass saved items
                          onToggleBookmarkInHome:
                              _toggleBookmark, // Pass toggle function
                        );
                      case 2:
                        return FashionPage(
                          categoryName: categoryNames[2],
                          allProjects: allProjects,
                          savedProjectsFromHome:
                              _savedItems, // Pass saved items
                          onToggleBookmarkInHome:
                              _toggleBookmark, // Pass toggle function
                        );
                      case 3:
                        return BeautyPage(
                          categoryName: categoryNames[3],
                          allProjects: allProjects,
                          savedProjectsFromHome:
                              _savedItems, // Pass saved items
                          onToggleBookmarkInHome:
                              _toggleBookmark, // Pass toggle function
                        );
                      case 4:
                        return FoodAndBeveragePage(
                          categoryName: categoryNames[4],
                          allProjects: allProjects,
                          savedProjectsFromHome:
                              _savedItems, // Pass saved items
                          onToggleBookmarkInHome:
                              _toggleBookmark, // Pass toggle function
                        );
                      default:
                        return const Center(child: Text('Category not found'));
                    }
                  },
                ),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(images[i], fit: BoxFit.cover),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFilterBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFilterButton(Icons.swap_vert, 'Sort by', isSortBy: true),
            _buildFilterButton(null, 'Top Raised'),
            _buildFilterButton(null, 'Closing soon'),
            _buildFilterButton(null, 'Viral'),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(height: 20),
      ],
    );
  }

  Widget _buildFilterButton(
    IconData? icon,
    String label, {
    bool isSortBy = false,
  }) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        if (isSortBy) {
          _showSortByBottomSheet();
        } else {
          setState(() {
            selectedFilter = isSelected ? null : label;
            // Filter 'allProjects' locally based on this selection.
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF082347) : Colors.transparent,
          border: Border.all(color: const Color(0xFF082347)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, size: 16, color: const Color(0xFF082347)),
            if (icon != null) const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            if (isSortBy)
              const Icon(Icons.arrow_drop_down, color: Color(0xFF082347)),
          ],
        ),
      ),
    );
  }

  void _showSortByBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Type of your investing',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                const Text(
                  'How would you like to invest, and get your return?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                _buildSortOption('Long Term'),
                _buildSortOption('Short Term'),
              ],
            ),
          ),
    );
  }

  Widget _buildSortOption(String option) {
    final isSelected = selectedSortOption == option;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSortOption = isSelected ? null : option;
          // Apply sort to 'allProjects' locally.
        });
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF082347) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF082347)),
        ),
        child: Center(
          child: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF082347),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF082347),
      ),
    ),
  );

  // This section now receives a filtered list of InvestmentItems
  Widget _buildInvestmentSection(List<InvestmentItem> list) => Container(
    color: const Color(0xFFD9E4FF),
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: SizedBox(
      height: 219, // Fixed height to fit InvestmentCard
      child: _buildInvestmentList(list), // Use the helper to build the list
    ),
  );
}

// Custom icon for Reels tab in the Bottom Navigation Bar
class _ReelsIcon extends StatelessWidget {
  const _ReelsIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF082347),
      ),
      child: const Icon(Icons.play_arrow, color: Colors.white),
    );
  }
}
