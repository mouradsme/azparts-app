import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/shimmer_notif/shimmer_notif_widget.dart';
import 'notifications_shimmer_widget.dart' show NotificationsShimmerWidget;
import 'package:flutter/material.dart';

class NotificationsShimmerModel
    extends FlutterFlowModel<NotificationsShimmerWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in NotificationsShimmer widget.
  ApiCallResponse? apiResulttx4;
  // Model for shimmerNotif component.
  late ShimmerNotifModel shimmerNotifModel;

  @override
  void initState(BuildContext context) {
    shimmerNotifModel = createModel(context, () => ShimmerNotifModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    shimmerNotifModel.dispose();
  }
}
