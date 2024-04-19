import '/app_bars/app_bar_cart/app_bar_cart_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  Local state fields for this page.

  dynamic cartItems;

  int cartIndex = 0;

  int? totalItems = 0;

  String? totalPrice = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in CartPage widget.
  ApiCallResponse? updateCartRes;
  // Model for AppBarCart component.
  late AppBarCartModel appBarCartModel;
  // Stores action output result for [Backend Call - API (Prepare CART)] action in CartItemComponent widget.
  ApiCallResponse? deletedAction;
  // Stores action output result for [Backend Call - API (Prepare CART)] action in UpdateCartBTN widget.
  ApiCallResponse? updateCartResOnClick;

  @override
  void initState(BuildContext context) {
    appBarCartModel = createModel(context, () => AppBarCartModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarCartModel.dispose();
  }
}
