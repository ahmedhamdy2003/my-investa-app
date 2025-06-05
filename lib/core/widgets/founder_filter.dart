import 'package:flutter/material.dart';

class FounderFilter extends StatefulWidget {
  const FounderFilter({super.key});

  @override
  State<FounderFilter> createState() => _FounderFilterState();
}

class _FounderFilterState extends State<FounderFilter> {
  int _selectedIndex = 0;

  final List<String> _filters = [
    'Daily',
    'Monthly',
    'Yearly',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedIndex == index;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 || index == (_filters.length - 1) ? 4 : 8,
                right: index == 0 || index == (_filters.length - 1) ? 4 : 8,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF3E4377) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
