import '/app_bars/app_bar_filter_results/app_bar_filter_results_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filter_results_page_widget.dart' show FilterResultsPageWidget;
import 'package:flutter/material.dart';

class FilterResultsPageModel extends FlutterFlowModel<FilterResultsPageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  int? noresults;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (POST Fetch Filtered Products )] action in FilterResultsPage widget.
  ApiCallResponse? resultapi;
  // Stores action output result for [Backend Call - API (Prepare CART)] action in FilterResultsPage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarFilterResults component.
  late AppBarFilterResultsModel appBarFilterResultsModel;

  @override
  void initState(BuildContext context) {
    appBarFilterResultsModel =
        createModel(context, () => AppBarFilterResultsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarFilterResultsModel.dispose();
  }
}
