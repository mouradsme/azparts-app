import '/app_bars/app_bar_checkout/app_bar_checkout_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_page_widget.dart' show CheckoutPageWidget;
import 'package:flutter/material.dart';

class CheckoutPageModel extends FlutterFlowModel<CheckoutPageWidget> {
  ///  Local state fields for this page.

  bool placeorderdisable = false;

  String totalPrice = '0';

  int totalItems = 0;

  int? deliveryfees = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in CheckoutPage widget.
  ApiCallResponse? checkoutCartResults;
  // Model for appBarCheckout component.
  late AppBarCheckoutModel appBarCheckoutModel;
  // Stores action output result for [Backend Call - API (Chekout)] action in Button widget.
  ApiCallResponse? checkoutResult;

  @override
  void initState(BuildContext context) {
    appBarCheckoutModel = createModel(context, () => AppBarCheckoutModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarCheckoutModel.dispose();
  }
}
