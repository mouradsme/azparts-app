import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'stop_desk_list_widget.dart' show StopDeskListWidget;
import 'package:flutter/material.dart';

class StopDeskListModel extends FlutterFlowModel<StopDeskListWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Calculate Total Fees)] action in Button widget.
  ApiCallResponse? calculateFees;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
