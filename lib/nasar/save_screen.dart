// هذا الملف يجب أن يحتوي على كلاس SaveScreen فقط.

import 'package:investa4/nasar/investment_card.dart';
import 'package:investa4/nasar/investment_item.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  List<InvestmentItem> _savedItems = [];
  bool _isLoading = true;
  String _errorMessage = '';

  // **IMPORTANT:** Base URL for your Backend
  // You MUST change 'http://10.0.2.2:8000/api/' to your actual API URL.
  static const String _baseUrl = 'http://10.0.2.2:8000/api/';

  @override
  void initState() {
    super.initState();
    _fetchSavedItems();
  }

  Future<void> _fetchSavedItems() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final response = await http.get(
        Uri.parse('${_baseUrl}user/saved_projects/'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          // **FIX START HERE:** Use .cast<InvestmentItem>() to resolve the type error
          _savedItems =
              data
                  .map((json) => InvestmentItem.fromJson(json))
                  .cast<InvestmentItem>()
                  .toList();
        });
      } else {
        setState(() {
          _errorMessage = "Failed to load saved items: ${response.statusCode}";
          _savedItems = [];
        });
        print("Failed to load saved items: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred: $e";
        _savedItems = [];
      });
      print("Error fetching saved items: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _removeBookmark(InvestmentItem item) async {
    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}user/toggle_saved_project/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer YOUR_AUTH_TOKEN', // Uncomment if authentication token is needed
        },
        body: jsonEncode({
          'project_id':
              item.title, // Prefer sending actual project ID instead of title
          'action': 'remove',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Bookmark removed successfully for: ${item.title}");
        _fetchSavedItems(); // Re-fetch the list to update UI
      } else {
        print("Failed to remove bookmark: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Failed to unsave project. Status: ${response.statusCode}",
            ),
          ),
        );
      }
    } catch (e) {
      print("Error removing bookmark: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Network error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Saved Items",
          style: TextStyle(
            color: Color(0xff082347),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xff082347)),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark, color: Color(0xff082347)),
            onPressed: () {
              // No functionality here currently
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffD9E4FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child:
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _errorMessage.isNotEmpty
                  ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  : _savedItems.isEmpty
                  ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "No saved items yet!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff082347),
                        ),
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: _savedItems.length,
                    itemBuilder: (context, index) {
                      final item = _savedItems[index];
                      return Column(
                        children: [
                          InvestmentCard(
                            assetImage: item.assetImage,
                            title: item.title,
                            description: item.description,
                            investedAmount: item.investedAmount,
                            investors: item.investors,
                            isSaved: true,
                            onBookmarkPressed: () => _removeBookmark(item),
                            onTap: () {
                              print('Tapped on saved item: ${item.title}');
                            },
                          ),
                          const Divider(
                            color: Colors.black26,
                            thickness: 1,
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
