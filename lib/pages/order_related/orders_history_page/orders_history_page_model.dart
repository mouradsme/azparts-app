import '/app_bars/app_bar_orders_history/app_bar_orders_history_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_history_page_widget.dart' show OrdersHistoryPageWidget;
import 'package:flutter/material.dart';

class OrdersHistoryPageModel extends FlutterFlowModel<OrdersHistoryPageWidget> {
  ///  Local state fields for this page.

  int? pending = 0;

  int? enRoute = 1;

  int? shipped = 2;

  int? cancelled = 3;

  dynamic results;

  dynamic filteredResults;

  int totalItems = 0;

  int? status;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in OrdersHistoryPage widget.
  ApiCallResponse? cartResults;
  // Stores action output result for [Backend Call - API (Fetch Orders History)] action in OrdersHistoryPage widget.
  ApiCallResponse? historyResults;
  // Model for appBarOrdersHistory component.
  late AppBarOrdersHistoryModel appBarOrdersHistoryModel;

  @override
  void initState(BuildContext context) {
    appBarOrdersHistoryModel =
        createModel(context, () => AppBarOrdersHistoryModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarOrdersHistoryModel.dispose();
  }
}
