import 'package:book_hive/data/book_data.dart';
import 'package:book_hive/presentation/auth/sign_in/items.dart';
import 'package:book_hive/search/search_bloc.dart';
import 'package:book_hive/search/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/playing/playing_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<SearchBloc>().add(SearchInputChanged(_searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<BookUiData> books = state.booksByCategory;


        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    hintText: 'search books...',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(
                        color: Color(0xFFF26B6C),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(
                        color: Color(0xFFF26B6C),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(
                        color: Color(0xFFF26B6C),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),


                SizedBox(height: 20,),
                Expanded(
                  child: books.isEmpty
                      ? Center(child: Text('No books found', style: TextStyle(color: Colors.red, fontSize: 32),))
                      : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: state.booksByCategory.length,
                    itemBuilder: (context, index) {
                      BookUiData item = state.booksByCategory[index] ;
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayingScreen(comingBook: item)));
                        },
                        child: itemBookSearch(item),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget itemBookSearch(BookUiData data) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),

    ),
    height: 250,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child:   Image.network(data.img?? 'https://via.placeholder.com/150', fit: BoxFit.cover),
    ),
  );
}

