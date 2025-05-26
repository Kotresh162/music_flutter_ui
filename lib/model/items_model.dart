import 'package:flutter/material.dart';

class Item {
  final String title;
  final String description;
  final String icon;
  final String backgroundImage;
  final Color iconColor;

  Item({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundImage,
    required this.iconColor,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      backgroundImage: data['backgroundImage'] ?? '',
      iconColor: _mapColor(data['iconColor'] ?? 'white'),
    );
  }

  static Color _mapColor(String name) {
    switch (name) {
      case 'redAccent':
        return Colors.redAccent;
      case 'blueAccent':
        return Colors.blueAccent;
      case 'greenAccent':
        return Colors.greenAccent;
      case 'yellow':
        return Colors.yellow;
      case 'purpleAccent':
        return Colors.purpleAccent;
      case 'pinkAccent':
        return Colors.pinkAccent;
      case 'teal':
        return Colors.teal;
      default:
        return Colors.white; // fallback
    }
  }
}
