import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_wilaya_widget.dart' show HomeWilayaWidget;
import 'package:flutter/material.dart';

class HomeWilayaModel extends FlutterFlowModel<HomeWilayaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownWilaya widget.
  String? dropDownWilayaValue;
  FormFieldController<String>? dropDownWilayaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
