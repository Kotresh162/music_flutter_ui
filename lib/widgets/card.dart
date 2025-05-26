import 'package:flutter/material.dart';

Color? parseColor(String? colorName) {
  switch (colorName) {
    case 'redAccent':
      return Colors.redAccent;
    case 'blueAccent':
      return Colors.blueAccent;
    case 'greenAccent':
      return Colors.greenAccent;
    case 'amber':
      return Colors.amber;
    default:
      return Colors.white;
  }
}

IconData getIconData(String? name) {
  switch (name) {
    case 'graphic_eq':
      return Icons.graphic_eq;
    case 'equalizer':
      return Icons.equalizer;
    case 'edit_note':
      return Icons.edit_note;
    case 'mic':
      return Icons.mic;
    default:
      return Icons.help_outline;
  }
}

Widget buildItemCard(Map<String, String> item, double screenWidth, double screenHeight) {
  // String backUrl = item['backgroundImage'].toString();
  return Center(
    child: Container(
      width: (330 / 390) * screenWidth,
      height: (67 / 844) * screenHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 1),
        image: DecorationImage(
          opacity: 0.5,
          image: NetworkImage(item['backgroundImage'].toString()),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(11),
            height: (47 / 844) * screenHeight,
            width: (47 / 390) * screenWidth,
            decoration: BoxDecoration(
              color: const Color(0xFF2F2F39),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              getIconData(item['icon']),
              color: parseColor(item['iconColor']),
              size: 32,
            ),
          ),

          // Text Section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] ?? 'one',
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['description'] ?? 'description',
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.chevron_right,
              color: Colors.white,
              weight: 800,
            ),
          ),
        ],
      ),
    ),
  );
}
