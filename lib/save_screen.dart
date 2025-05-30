import 'package:flutter/material.dart';
import 'investment_item.dart';
import 'investment_card.dart';

class SaveScreen extends StatelessWidget {
  final List<InvestmentItem> savedItems;

  SaveScreen({required this.savedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لا يتم تحديد backgroundColor للـ Scaffold؛ الحاوية (Container) تحدد الخلفية الخاصة بها.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Saved Items",
            style: TextStyle(
                color: Color(0xff082347), fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Color(0xff082347)),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark, color: Color(0xff082347)),
            onPressed: () {
              // يمكن إضافة وظيفة هنا إذا لزم الأمر
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffD9E4FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: savedItems.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("No saved items yet!",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff082347))),
                  ),
                )
              : ListView.builder(
                  itemCount: savedItems.length,
                  itemBuilder: (context, index) {
                    final item = savedItems[index];
                    return Column(
                      children: [
                        InvestmentCard(
                          assetImage: item.assetImage,
                          title: item.title,
                          description: item.description,
                          investedAmount: item.investedAmount,
                          investors: item.investors,
                          isSaved: true,
                          onBookmarkPressed: () {
                            // يمكن السماح بحذف البطاقة من المحفوظات هنا
                          },
                        ),
                        Divider(
                            color: Colors.black26, thickness: 1, height: 20),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
