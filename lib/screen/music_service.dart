import 'package:flutter/material.dart';

class MusicService extends StatefulWidget {
  const MusicService({super.key});

  @override
  State<MusicService> createState() => _MusicServiceState();
}

class _MusicServiceState extends State<MusicService> {
  @override
  Widget build(BuildContext context) {
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;
    return  Scaffold(
        backgroundColor: Color(0xFF18171C),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: (390 / 844) * Screenheight,
                  decoration: BoxDecoration(
                    color: Color(0xFFA90140),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // 🔍 Search Bar
                      //
                       SizedBox(height: (49/844)*Screenheight),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: (299/390)*Screenwidth,
                                child: TextField(
                                decoration: InputDecoration(
                                hintText: 'Search...',
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                          ),
                              ),
                              CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage('assets/profile.jpg'),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 16),
                      Container(
                        width: Screenwidth,
                        height: (257/844)*Screenheight,
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.only(left: (14/390)*Screenwidth),
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
                            // Positioned(
                            //   left: -30,
                            //   bottom: 0,
                            //   child: Image.asset(
                            //     'lib/assets/circular.png',
                            //     width: 80,
                            //   ),
                            // ),

                            // Right Keyboard Image
                            // Positioned(
                            //   right: -30,
                            //   top: 0,
                            //   child: Image.asset(
                            //     'lib/assets/keyboard.png',
                            //     width: 100,
                            //   ),
                            // ),

                            // Center Text Content
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Claim your",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "Free Demo",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lobster',
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
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    child: Text("Book Now"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )

                    ]
                  ),
                )

              ],
            )
          ],
        ),
      );
  }
}
