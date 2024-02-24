import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/app_color.dart';
import 'package:solution_challenge/view/home_screen.dart';
import 'package:solution_challenge/view/news_screen.dart';
import 'package:solution_challenge/view/notification_screen.dart';
import 'package:solution_challenge/view/search_screen.dart';
import 'package:solution_challenge/view/training_videos_screen.dart';
import 'package:solution_challenge/widgets/drawer_header_widget.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    NewsScreen(),
    NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
        indicatorColor: Colors.amber,
        backgroundColor: Colors.white,
        elevation: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper_rounded),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Notifications',
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeaderWidget(),
            const SizedBox(
              height: 20,
            ),
            getDrawerMenuItem(
                Icons.video_collection_outlined,
                'Training Vidous',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrainingVideosScreen(),
                    ))),
            getDrawerMenuItem(
                Icons.text_snippet_outlined, 'Surveys', () => null),
            getDrawerMenuItem(Icons.phone_outlined, 'Contact', () => null),
            getDrawerMenuItem(Icons.info_outline, 'About Us', () => null),
          ],
        ),
      ),
    
    );
  }

    Widget getDrawerMenuItem(
      IconData itemIcon, String menuTitle, Function() ontop) {
    return ListTile(
      leading: Icon(
        itemIcon,
        color: menuIconColor,
      ),
      title: Text(menuTitle),
      onTap: ontop,
    );
  }
  
}
