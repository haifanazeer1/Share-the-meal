import 'package:flutter/material.dart';

class FilterSortBar extends StatelessWidget {
  const FilterSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildOption(Icons.filter_list, 'Filter'),
          const SizedBox(width: 10),
          _buildOption(Icons.sort, 'Sort By'),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String label, {bool isMultiLine = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.green),
          const SizedBox(width: 6),
          isMultiLine
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: label
                      .split('\n')
                      .map((line) =>
                          Text(line, style: const TextStyle(fontSize: 12)))
                      .toList(),
                )
              : Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
