import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../api/items_fetch_api.dart';
import '../model/items_model.dart';
import '../widgets/card.dart';
import 'customenavbar.dart';
import 'extra.dart';
import 'item_descroption.dart';

class MusicService extends StatefulWidget {
  const MusicService({super.key});
  @override
  State<MusicService> createState() => _MusicServiceState();
}

class _MusicServiceState extends State<MusicService> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
    Center(child: Text('Profile',)),
  ];

  final List<Map<String, String>> items = [];

  void loadItems() async {
    FirestoreService firestoreService = FirestoreService();
    List<Item> fetchedItems = await firestoreService.fetchItems();

    // Clear existing items if needed
    items.clear();

    // Convert each Item into a Map<String, String> and add to `items` list
    for (var item in fetchedItems) {
      items.add({
        "title": item.title ?? '',
        "description": item.description ?? '',
        "backgroundImage": item.backgroundImage ?? '',
        "icon": item.icon ?? '',
        "iconColor": item.iconColor.toString() ?? '',
      });
    }
    print(items);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;
    loadItems();
    return  Scaffold(
        backgroundColor: Color(0xFF18171C),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: (390 / 844) * Screenheight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFA90140), Color(0xFF69002E)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top padding for status bar
                      SizedBox(height: MediaQuery.of(context).padding.top + 10),

                      // Search Bar & Profile Row
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (299 / 390) * Screenwidth,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search “Punjabi Lyrics”',
                                  hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Syne'),
                                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                                  suffixIcon: Icon(Icons.mic_none_outlined, color: Colors.white70),
                                  filled: true,
                                  fillColor: Color(0xFF2F2F39),
                                  contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage('assets/user.png'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),

                      // Main Promo Section
                      Container(
                        width: Screenwidth,
                        height: (257 / 844) * Screenheight,
                        padding: EdgeInsets.only(left: (14 / 390) * Screenwidth),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF9D0D46), Color(0xFF2E002B)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Left Disc Image
                            Positioned(
                              left: -20,
                              bottom: 0,
                              child: Image.asset(
                                'assets/circular.png',
                                width: (134/390)*Screenwidth,
                                height: (119/844)*Screenheight,
                              ),
                            ),

                            // Right Keyboard Image
                            Positioned(
                              right: -20,
                              bottom: 0,
                              child: Image.asset(
                                'assets/keyboard.png',
                                width: (134/390)*Screenwidth,
                                height: (119/844)*Screenheight,
                              ),
                            ),

                            // Center Text and Button
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Claim your",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Free Demo",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 42,
                                    fontFamily: 'Lobster',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "for custom Music Production",
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                                SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(96, 36), // Width: 96, Height: 36
                                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50), // Radius: 50px
                                    ),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,color: Colors.black),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: (70/844)*Screenheight,
                  width: (323/390)*Screenwidth,
                  // color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(bottom: 24,top: 24),
                  child: Text("Hire hand-picked Pros for popular music services",style: TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.w400,fontSize: 15),),
                ),
                Container(
                  height: (300 / 844) * Screenheight,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(items.length * 2 - 1, (index) {
                        if (index.isEven) {
                          final item = items[index ~/ 2];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the respective page for this item
                              print(item['title']);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => RespectivePage(item['title'].toString(),item['description'].toString()),
                              //   ),
                              // );
                            },
                            child: buildItemCard(item, Screenwidth, Screenheight),
                          );
                        } else {
                          return const SizedBox(height: 11);
                        }
                      }),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      );
  }
}

