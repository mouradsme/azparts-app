import '/app_bars/app_bar_cart/app_bar_cart_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  int totalitems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in ProfilePage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarCart component.
  late AppBarCartModel appBarCartModel;
  // Stores action output result for [Backend Call - API (App Settings)] action in Row widget.
  ApiCallResponse? settings;
  // Stores action output result for [Backend Call - API (App Settings)] action in Row widget.
  ApiCallResponse? callSettings;

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
