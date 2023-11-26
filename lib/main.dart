import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InstaCloneHome(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
        useMaterial3: true,
      ),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // pub.dev에서 google_fonts 검색 후 사용
        title:  Text('Instagram', style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined,size: 32),
            onPressed: () {
              print('Tab favorite');
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.paperplane,size: 32),
            onPressed: () {
              print('Tab paperplane');
            },
          ),
          ],
      ),
      body:  InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => setState(() => index = newIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home,size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search,size: 28),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
