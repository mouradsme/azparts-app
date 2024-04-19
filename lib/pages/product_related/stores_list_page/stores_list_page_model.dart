import '/app_bars/app_bar_stores_page/app_bar_stores_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stores_list_page_widget.dart' show StoresListPageWidget;
import 'package:flutter/material.dart';

class StoresListPageModel extends FlutterFlowModel<StoresListPageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in StoresListPage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarStoresPage component.
  late AppBarStoresPageModel appBarStoresPageModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;

  @override
  void initState(BuildContext context) {
    appBarStoresPageModel = createModel(context, () => AppBarStoresPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarStoresPageModel.dispose();
  }
}
