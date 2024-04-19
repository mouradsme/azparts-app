import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'deliveryinfos_widget.dart' show DeliveryinfosWidget;
import 'package:flutter/material.dart';

class DeliveryinfosModel extends FlutterFlowModel<DeliveryinfosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for fristNameField widget.
  FocusNode? fristNameFieldFocusNode;
  TextEditingController? fristNameFieldTextController;
  String? Function(BuildContext, String?)?
      fristNameFieldTextControllerValidator;
  String? _fristNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for secondNameField widget.
  FocusNode? secondNameFieldFocusNode;
  TextEditingController? secondNameFieldTextController;
  String? Function(BuildContext, String?)?
      secondNameFieldTextControllerValidator;
  String? _secondNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 32) {
      return 'Maximum 32 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for phonenumberFiels widget.
  FocusNode? phonenumberFielsFocusNode;
  TextEditingController? phonenumberFielsTextController;
  String? Function(BuildContext, String?)?
      phonenumberFielsTextControllerValidator;
  String? _phonenumberFielsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for RadioButtonisDesk widget.
  FormFieldController<String>? radioButtonisDeskValueController;

  @override
  void initState(BuildContext context) {
    fristNameFieldTextControllerValidator =
        _fristNameFieldTextControllerValidator;
    secondNameFieldTextControllerValidator =
        _secondNameFieldTextControllerValidator;
    phonenumberFielsTextControllerValidator =
        _phonenumberFielsTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fristNameFieldFocusNode?.dispose();
    fristNameFieldTextController?.dispose();

    secondNameFieldFocusNode?.dispose();
    secondNameFieldTextController?.dispose();

    phonenumberFielsFocusNode?.dispose();
    phonenumberFielsTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonisDeskValue => radioButtonisDeskValueController?.value;
}
