import 'package:book_hive/data/book_data.dart';
import 'package:book_hive/presentation/auth/sign_in/items.dart';
import 'package:book_hive/presentation/home/home_bloc.dart';
import 'package:book_hive/presentation/home/home_event.dart';
import 'package:book_hive/presentation/home/home_state.dart';
import 'package:book_hive/presentation/library/library_screen.dart';
import 'package:book_hive/presentation/playing/playing_screen.dart';
import 'package:book_hive/presentation/profile/profile_screen.dart';
import 'package:book_hive/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/category_data.dart';
import '../../data/repo.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  List<String> listCategory = [];


  void initState() {
    super.initState();
    _fetchCategories().then((categories) {
      setState(() {
        listCategory = categories;
      });

      context.read<HomeBloc>().add(LoadDataEvent(categoryName: listCategory[0]));

    });
  }

  Future<List<String>> _fetchCategories() async {
    List<BookUiData> books = await Repo().getBooks();
    List<String> categoryTitles = books.map((book) => book.category).toList();
    return categoryTitles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Explore',
            style: TextStyle(
              color: Color(0xFFF26B6C),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black87, size: 28),
            onPressed: () {},
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Category ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('see all',
                      style: TextStyle(
                        color: Color(0xFFF26B6C),
                        fontSize: 18,
                      ))
                ],
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCategory.length,
                  itemBuilder: (context, index) {
                    String singlecategoryName = listCategory[index];
                    CustomColor categoryColor = getCategoryColor(index);
                    return InkWell(
                      onTap: () {

                          selectedCategory = index;
                          context.read<HomeBloc>().add(LoadDataEvent(categoryName: singlecategoryName));
                      },
                      child: itemHome(singlecategoryName, categoryColor.col1, categoryColor.col2),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8.0);
                  },
                ),
              ),

              SizedBox(height: 24.0),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {

                },
                builder: (context, state) {

               //   context.read<HomeBloc>().add(LoadDataEvent(categoryName: sinle))
                  if(state.isLoading){
                    return Center(child: CircularProgressIndicator());
                  }else if(state.hasError){
                    return Center(child: Text(state.errorMessage));
                  }else if (state.booksByCategory.isEmpty) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,

                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: 20, // Adjust based on desired number of shimmer items
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    );
                  }else{

                    // List<BookUiData> filteredBooks = state.booksByCategory
                    //     .where((book) => book.category == listCategory[selectedCategory])
                    //     .toList();
                    return GridView.builder(
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
                        BookUiData item = state.booksByCategory[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayingScreen(comingBook: item)));
                          },
                          child: itemBook(item),
                        );
                      },
                    );
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


List<CustomColor> colorCategory =   [
 CustomColor(  Color(0xFFcaf0f8),  Colors.blue, ),
 CustomColor(  Color(0xFFfcd5ce),  Colors.red, ),
 CustomColor(  Color(0xFFdde5b6),  Colors.green, ),
 CustomColor(  Color(0xFFfcf6bd),  Colors.yellow, ),
];

CustomColor getCategoryColor(int index) {
  return colorCategory[index % colorCategory.length];
}


class CustomColor{
  Color col1;
  Color col2;
  CustomColor( this.col1,  this.col2);
}