import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_component_widget.dart' show CartItemComponentWidget;
import 'package:flutter/material.dart';

class CartItemComponentModel extends FlutterFlowModel<CartItemComponentWidget> {
  ///  Local state fields for this component.

  double itemTotalPrice = 0.0;

  int? itemIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for qtycart widget.
  int? qtycartValue;
  // Stores action output result for [Backend Call - API (Prepare CART)] action in Button widget.
  ApiCallResponse? afterDelete;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
