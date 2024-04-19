import '/app_bars/app_bar_store_page/app_bar_store_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stores_profilepage_widget.dart' show StoresProfilepageWidget;
import 'package:flutter/material.dart';

class StoresProfilepageModel extends FlutterFlowModel<StoresProfilepageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in StoresProfilepage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarStorePage component.
  late AppBarStorePageModel appBarStorePageModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    appBarStorePageModel = createModel(context, () => AppBarStorePageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarStorePageModel.dispose();
    tabBarController?.dispose();
  }
}
