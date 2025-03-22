class AppLink {
  static const String server = 'http://192.168.1.3/ecommerce%20app%20backend/';
  static const String images = '${server}upload';

  //------------------------- Images ---------------------------
  static const String categoriesImages = '${server}upload/categories';
  static const String itemsImages = '${server}upload/items';
  //------------------------- Images ---------------------------

  static const String test = '${server}test.php';
  //------------------------- Auth ---------------------------
  static const String signup = '${server}auth/signup.php';
  static const String login = '${server}auth/login.php';
  static const String resend = '${server}auth/resnd.php';
  static const String verifycode = '${server}auth/verifycode.php';
  static const String forgetpasswordverifycode =
      '${server}forgetpassword/verifycode.php';
  static const String forgetpasswordcheckemail =
      '${server}forgetpassword/checkemail.php';
  static const String forgetpasswordresetpassword =
      '${server}forgetpassword/resetpassword.php';

//--------------------------- APP Pages ------------------------
  static const String homePage = '${server}home.php';
  static const String itemsPage = '${server}items/items.php';

//--------------------------- Favorite ------------------------

  static const String favoriteadd = '${server}favorite/add.php';
  static const String favoriteremove = '${server}favorite/remove.php';
  static const String favoriteview = '${server}favorite/view.php';
  static const String deleteitemfromfav =
      '${server}favorite/deleteitemfromfav.php';

//--------------------------- Cart ------------------------

  static const String cartadd = '${server}cart/add.php';
  static const String cartremove = '${server}cart/remove.php';
  static const String cartview = '${server}cart/view.php';
  static const String cartgetitemcounts = '${server}cart/cartgetitemcounts.php';
  // static const String deleteitemfromcart =
  //     '${server}cart/deleteitemfromcart.php';
  // static const String updatecart = '${server}cart/updatecart.php';
  // static const String checkout = '${server}cart/checkout.php';
}
