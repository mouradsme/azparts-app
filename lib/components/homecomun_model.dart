import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'homecomun_widget.dart' show HomecomunWidget;
import 'package:flutter/material.dart';

class HomecomunModel extends FlutterFlowModel<HomecomunWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for hDropDown widget.
  String? hDropDownValue;
  FormFieldController<String>? hDropDownValueController;
  // Stores action output result for [Backend Call - API (Calculate Total Fees)] action in Button widget.
  ApiCallResponse? calculateFees;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
