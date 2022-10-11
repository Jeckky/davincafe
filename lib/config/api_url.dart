final HOSTNAME = "https://davin-cafe.onrender.com";

class API_URL {
  API_URL._();
  static final PATH = "";
  //static final PATH = "/api/v1";

  static final URL = HOSTNAME + PATH;

  static final PRODUCT_URL = "${URL}/products";
  static final CATEGORY_URL = "${URL}/categories/category";
  static final COFFEE_BEAN_URL = "${URL}/coffee_bean";
  static final ROAST_LEVEL_URL = "${URL}/roast_level";
  static final HOW_TO_ORDER_POS = "${URL}/how_to_order";
  static final ORDERS_STATUS_URL = "${URL}/orders_status";
  static final UPDATE_ITEM = "${URL}/{id}/update";
  static final DELETE = "${URL}/{id}/delete";

  static final UPDATESTATUS_URL = "${URL}/order_list/{id}/updatestatus";
  static final SEARCH_URL = "${URL}/order_detail/search/?q={q}&by={by}&t={t}";
}
