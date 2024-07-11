import 'package:book_hive/presentation/auth/sign_in/items.dart';
import 'package:book_hive/presentation/library/library_bloc.dart';
import 'package:book_hive/presentation/library/library_screen.dart';
import 'package:book_hive/presentation/playing/playing_screen.dart';
import 'package:book_hive/presentation/profile/profile_bloc.dart';
import 'package:book_hive/presentation/profile/profile_screen.dart';
import 'package:book_hive/search/search_bloc.dart';
import 'package:book_hive/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home_bloc.dart';
import '../home/home_event.dart';
import '../home/home_screen.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Bottom> {

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) =>
      HomeBloc()
        ..add(AllBooksLoadEvent()),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => SearchBloc()..add(AllBooksEventInSearch()),
      child: SearchScreen(),
    ),
    BlocProvider(
      create: (context) => LibraryBloc(),
      child: LibraryScreen(),
    ),
    BlocProvider(
      create: (context) => ProfileBloc(),
      child: ProfileScreen(),
    ),
  ];


  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: IndexedStack(
        index: _selectedIndex, // Display the selected screen
        children: _screens,
      ),


      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => PlayingScreen()));
        },
        backgroundColor: Color(0xFFF26B6C),
        // Orqa fon rangi
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.play_arrow,
          size: 42,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 74,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBottomNavigationItem(Icons.home, 'Home', 0),
              _buildBottomNavigationItem(Icons.search, 'Search', 1),
              const SizedBox(width: 4), // Add a gap in the middle
              _buildBottomNavigationItem(Icons.library_books, 'Library', 2),

              _buildBottomNavigationItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: _selectedIndex == index ? Color(0xFFF26B6C) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Color(0xFFF26B6C) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


final colorList = [
  (const Color(0xffead4d4), Colors.red), // Lighter red
  (const Color(0xffeef6e0), Colors.green), // Lighter green
  (const Color(0xff64ade8), Colors.blue), // Original blue
  (const Color(0xffeedd9d), Colors.yellow), // Original yellow
  (const Color(0xffc695e3), Colors.purple), // Original purple
  (const Color(0xffe1be9a), Colors.orange), // Original orange
  (const Color(0xffe7b1c8), Colors.pink), // Original pink
  (const Color(0xffc9e1c0), Colors.teal), // Original teal
  (const Color(0xffe1e5f8), Colors.indigo), // Original indigo
];

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.colorIndex,
    required this.category,
    required this.onClick,
    this.isChosen = false,
  });

  final int colorIndex;
  final String category;
  final VoidCallback onClick;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    int colorIndex = this.colorIndex;

    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      height: 64,
      width: 132,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isChosen ? colorList[colorIndex % 9].$2 : colorList[colorIndex %
            9].$1,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        category,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(
          color: isChosen ? Colors.white : colorList[colorIndex % 9].$2,
        ),
      ),
    );
  }
}

