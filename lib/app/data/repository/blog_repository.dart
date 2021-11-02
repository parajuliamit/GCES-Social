import 'package:shared_preferences/shared_preferences.dart';

class BlogRepository {
  final SharedPreferences _sharedPreferences;

  BlogRepository(this._sharedPreferences);

  // Future<Cart> getCart() {
  //   return CartCache(_sharedPreferences).get();
  // }

  // Future<Cart> updateCart(Cart cart) {
  //   return CartCache(_sharedPreferences).set(cart);
  // }

  // Future<bool> deleteCart() {
  //   return CartCache(_sharedPreferences).delete();
  // }

}
