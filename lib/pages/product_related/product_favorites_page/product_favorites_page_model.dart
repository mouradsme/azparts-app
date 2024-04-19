import '/app_bars/app_bar_favorites_page/app_bar_favorites_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_favorites_page_widget.dart' show ProductFavoritesPageWidget;
import 'package:flutter/material.dart';

class ProductFavoritesPageModel
    extends FlutterFlowModel<ProductFavoritesPageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in ProductFavoritesPage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarFavoritesPage component.
  late AppBarFavoritesPageModel appBarFavoritesPageModel;

  @override
  void initState(BuildContext context) {
    appBarFavoritesPageModel =
        createModel(context, () => AppBarFavoritesPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarFavoritesPageModel.dispose();
  }
}
