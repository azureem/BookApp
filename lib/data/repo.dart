import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../presentation/auth/sign_in/items.dart';
import 'book_data.dart';
import 'category_data.dart';

class Repo{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<BookUiData>> getBooksByCategory(String category) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('books')
          .where('category', isEqualTo: category)
          .get();

      List<BookUiData> bookList = querySnapshot.docs.map((doc) {
        return BookUiData.fromFireStore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();

      return bookList;
    } catch (e) {
      print("Error fetching books by category: $e");
      return []; // Return an empty list on error
    }
  }



  //
  // Future<List<BookUiData>> getBooks() async {
  //   try {
  //     QuerySnapshot querySnapshot = await firestore.collection('books').get();
  //
  //     List<BookUiData> bookList = querySnapshot.docs.map((doc) {
  //       return BookUiData.fromFirestore(doc.data() as Map<String, dynamic>,);
  //     }).toList();
  //
  //     return bookList;
  //   } catch (e) {
  //     print("Error fetching books: $e");
  //     return [BookUiData(title: 'Mehri', author: 'Mehri',
  //         category: 'Mehri', audio: 'audio', doc: 'doc',
  //         img: 'https://img.goodfon.ru/original/1680x1050/4/7f/olga-boyko-bogdana-shatenka-krasotka-v-chernom-poza-shliapa.jpg')];
  //   }
  // }
  //

  Future<List<BookUiData>> getBooks() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('books').get();

    return snapshot.docs.map((doc) {
      return BookUiData.fromFireStore(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }


  // Future<CategoryData> getBooksByCategory(String category) async {
  //
  //   try {
  //     QuerySnapshot querySnapshot = await firestore
  //         .collection('books')
  //         .where('category', isEqualTo: category)
  //         .get();
  //
  //     List<BookUiData> bookList = querySnapshot.docs.map((doc) {
  //       return BookUiData.fromFireStore(doc.data() as Map<String, dynamic>, doc.id);
  //     }).toList();
  //
  //     return CategoryData(categoryName: category, bookList: bookList);
  //   }
  //   catch (e) {
  //     print("Error fetching books by category: $e");
  //     return CategoryData(categoryName: category, bookList: []);
  //   }
  // }


  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print("Error: $error");
    }
  }


  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("User created successfully!");
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print("Error: ${error.message}");
      }
    } catch (error) {
      print("An unexpected error occurred: $error");
    }
  }















// Improved getCategories function
  Future<List<CategoryData>> getCategories() async {
    try {
      // Create an empty set to store unique categories
      Set<String> categories = {};

      // Get all documents from the 'books' collection
      QuerySnapshot querySnapshot = await firestore.collection('books').get();

      // Iterate through each document in the snapshot
      for (DocumentSnapshot doc in querySnapshot.docs) {
        // Extract category from the book
        String categoryName = doc['category']; // Assuming 'category' field exists

        // Add the category to the set (if unique)
        categories.add(categoryName);
      }

      // Convert the set of categories into a list of CategoryData objects
      List<CategoryData> categoryList = categories.map((categoryName) {
        // Create an empty list for the book list
        List<BookUiData> bookList = [];

        // You can potentially add logic to fetch books for this category here
        // (consider pagination or filtering if needed)

        return CategoryData(categoryName: categoryName, bookList: bookList);
      }).toList();

      return categoryList;
    } catch (e) {
      print("Error fetching categories: $e");
      return []; // Return an empty list on error
    }

}








  Future<UserCredential?> registerWithGoogle() async {
    try {
      print("Initiating Google sign-in for registration...");

      // Sign in with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print("Google sign-in aborted");
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Create the user account in Firebase Authentication
      final UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: googleUser.email,
        password: "${googleUser.id}${DateTime.now().millisecondsSinceEpoch}",
      );

      print("Google sign-in and user registration successful");
      return userCredential;
    } catch (error) {
      print("Google sign-in and registration error: $error");
      return null;
    }
  }








}

