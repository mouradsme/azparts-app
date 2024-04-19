import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_filter_value_component_widget.dart'
    show DynamicFilterValueComponentWidget;
import 'package:flutter/material.dart';

class DynamicFilterValueComponentModel
    extends FlutterFlowModel<DynamicFilterValueComponentWidget> {
  ///  Local state fields for this component.

  double filterValue = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for FilterValue widget.
  FocusNode? filterValueFocusNode;
  TextEditingController? filterValueTextController;
  String? Function(BuildContext, String?)? filterValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    filterValueFocusNode?.dispose();
    filterValueTextController?.dispose();
  }
}
