import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/product.dart';
import '../views/home.dart';
import '../views/login.dart';

/// AuthController manages user authentication
class AuthController extends GetxController {
  /// Singleton instance of AuthController.
  static AuthController instance = Get.find();

  /// Reactive variable for the authenticated user.
  late Rx<User?> authUser;

  /// FirebaseAuth instance for authentication operations.
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Observable list of favorite products.
  var favorites = <Product>[].obs; // Observable list of favorite products

  @override
  void onInit() {
    super.onInit();
    // Initialize authUser with the current user.
    authUser = Rx<User?>(auth.currentUser);

    // Bind the authUser stream to listen for authentication changes.
    authUser.bindStream(auth.userChanges());

    // Listen for changes to authUser and call _initialScreen when it changes.
    ever(authUser, _initialScreen);
  }

  /// Handles the initial screen based on user's authentication status.
  ///
  /// Navigates to the HomeScreen if the user is authenticated,
  /// otherwise navigates to the LoginScreen.
  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  /// Registers a new user with email and password.
  ///
  /// Shows a snackbar with an error message if registration fails.
  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Logs in a user with email and password.
  ///
  /// Shows a snackbar with an error message if login fails.
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Toggles the favorite status of a product.
  ///
  /// Adds the product to the favorites list if it is not already a favorite,
  /// otherwise removes it from the list.
  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  /// Checks if a product is already in the favorites list.
  ///
  /// Returns true if the product is a favorite, otherwise false.
  bool isFavorite(Product product) {
    return favorites.contains(product);
  }

  /// Logs out the current user
  void signOut() async {
    await auth.signOut();
  }
}
