import '/app_bars/app_bar_oraderdetails/app_bar_oraderdetails_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_details_page_widget.dart' show OrderDetailsPageWidget;
import 'package:flutter/material.dart';

class OrderDetailsPageModel extends FlutterFlowModel<OrderDetailsPageWidget> {
  ///  Local state fields for this page.

  int totalitems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in OrderDetailsPage widget.
  ApiCallResponse? cartResults;
  // Model for appBarOraderdetails component.
  late AppBarOraderdetailsModel appBarOraderdetailsModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {
    appBarOraderdetailsModel =
        createModel(context, () => AppBarOraderdetailsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarOraderdetailsModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
