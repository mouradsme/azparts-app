import '/app_bars/app_bar_cart/app_bar_cart_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'notifications_page_widget.dart' show NotificationsPageWidget;
import 'package:flutter/material.dart';

class NotificationsPageModel extends FlutterFlowModel<NotificationsPageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  int? pending = 0;

  int? enroute = 1;

  int? shipped = 2;

  int? cancelled = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in NotificationsPage widget.
  ApiCallResponse? apiResulttx4;
  // Model for AppBarCart component.
  late AppBarCartModel appBarCartModel;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {
    appBarCartModel = createModel(context, () => AppBarCartModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarCartModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
