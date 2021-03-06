// ignore_for_file: non_constant_identifier_names

class ApiLink {
  final BASE_URL = "http://13.235.254.168:5000";
  final USER_LOGIN_URL = "/user/signin";
  final USER_REGISTER = "/user";
  final GET_ALL_STORE = "/store/stores";

  // use store id
  final GET_ALL_PRODUCTS = "/product/products/";

  // get user details,$userId.
  final GET_USER_DETAILS = "/user/";

  final GET_CART_PRODUCT = "/cart/";

  final ADD_ITEM_CART = "/cart/add-item/";

  // Userid and procuctId.
  final DELECT_CART_NAME = "/cart/delete-item/";

  final INCREMENT_CART_ITEM = "/cart/increment-item/";

  final DECREMENT_CART_ITEM = "/cart/decrement-item/";

  final SEARCH_PRODUCT_ALL_STORE = "/product/search/";

//Store id
  final SEARCH_PRODUCT_INSIDE_STORE = "/product/search-products/";

// product id and store id
  final GET_SINGLE_PRODUCT = "/product/";

  final GET_ALL_PRODUCT_ALL_STORE = "/product/products";

  // clear cart
  //final CLEAR_CART = "/cart/";

  //create new order
  final CREATE_NEW_ORDER = "/order";

  //get all order by user id

  final GET_ORDER_USER = "/order/user/";
}
