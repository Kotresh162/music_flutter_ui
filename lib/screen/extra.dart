import 'package:flutter/material.dart';

class ScrollableInContainer extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "title": "First Item",
      "description": "This is the first item's description.",
      "image": "https://via.placeholder.com/400x200",
    },
    {
      "title": "Second Item",
      "description": "Details about the second item go here.",
      "image": "https://via.placeholder.com/400x200/0000FF/808080",
    },
    {
      "title": "Third Item",
      "description": "Some information about the third item.",
      "image": "https://via.placeholder.com/400x200/FF0000/FFFFFF",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inside a Container")),
      body: Center(
        child: Container(
          height: 400, // Height of the outer container
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.grey)],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: items.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(16),
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item["image"]!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(Icons.info, size: 16, color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            item["title"]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        item["description"]!,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
