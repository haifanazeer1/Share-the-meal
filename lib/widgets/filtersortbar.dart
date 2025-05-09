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
          _buildOption(
            context,
            icon: Icons.filter_list,
            label: 'Filter',
            items: ['All', 'Distance', 'Veg', 'Veg and Non-Veg'],
            onSelected: (value) {
              print('Filter selected: $value');
            },
          ),
          const SizedBox(width: 10),
          _buildOption(
            context,
            icon: Icons.sort,
            label: 'Sort By',
            items: ['Distance', 'Name', 'Time'],
            onSelected: (value) {
              print('Sort selected: $value');
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required List<String> items,
    required void Function(String) onSelected,
  }) {
    return PopupMenuButton<String>(
        onSelected: onSelected,
        itemBuilder: (context) => items
            .map((item) => PopupMenuItem(value: item, child: Text(item)))
            .toList(),
        offset: const Offset(0, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
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
              Text(label, style: const TextStyle(fontSize: 14)),
              const Icon(Icons.arrow_drop_down, color: Colors.green),
            ],
          ),
        ));
  }
}
