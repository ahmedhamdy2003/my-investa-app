// هذا الملف يجب أن يحتوي على كلاس InvestmentCard فقط.

import 'package:flutter/material.dart';

// القيم الثابتة، ممكن تنقلها لملف constants.dart لو عايز تنظم أكتر
const Color kMetricTextColor = Color(0xFF001F3F);
const double kCardDividerThickness = 1.0;

class InvestmentCard extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final String investedAmount;
  final String investors;
  final VoidCallback onBookmarkPressed;
  final bool isSaved;
  final VoidCallback? onTap;

  const InvestmentCard({
    Key? key,
    required this.assetImage,
    required this.title,
    required this.description,
    required this.investedAmount,
    required this.investors,
    required this.onBookmarkPressed,
    required this.isSaved,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                assetImage,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF082347)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black87),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(
                        color: Colors.black26,
                        thickness: kCardDividerThickness),
                    SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(investedAmount,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text('invested',
                                    style: const TextStyle(
                                        fontSize: 12, color: kMetricTextColor)),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(investors,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text('investors',
                                    style: const TextStyle(
                                        fontSize: 12, color: kMetricTextColor)),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
