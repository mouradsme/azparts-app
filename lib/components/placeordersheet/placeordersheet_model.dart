import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'placeordersheet_widget.dart' show PlaceordersheetWidget;
import 'package:flutter/material.dart';

class PlaceordersheetModel extends FlutterFlowModel<PlaceordersheetWidget> {
  ///  Local state fields for this component.

  bool? nameValidation;

  bool? lasNameValidation;

  bool? phoneValidation;

  bool? wilayaValidation;

  List<String> communesList = [];
  void addToCommunesList(String item) => communesList.add(item);
  void removeFromCommunesList(String item) => communesList.remove(item);
  void removeAtIndexFromCommunesList(int index) => communesList.removeAt(index);
  void insertAtIndexInCommunesList(int index, String item) =>
      communesList.insert(index, item);
  void updateCommunesListAtIndex(int index, Function(String) updateFn) =>
      communesList[index] = updateFn(communesList[index]);

  Color nameBorderColor = const Color(0x00000000);

  bool selectionPending = false;

  List<String> centersList = [];
  void addToCentersList(String item) => centersList.add(item);
  void removeFromCentersList(String item) => centersList.remove(item);
  void removeAtIndexFromCentersList(int index) => centersList.removeAt(index);
  void insertAtIndexInCentersList(int index, String item) =>
      centersList.insert(index, item);
  void updateCentersListAtIndex(int index, Function(String) updateFn) =>
      centersList[index] = updateFn(centersList[index]);

  List<String> wilayasList = [];
  void addToWilayasList(String item) => wilayasList.add(item);
  void removeFromWilayasList(String item) => wilayasList.remove(item);
  void removeAtIndexFromWilayasList(int index) => wilayasList.removeAt(index);
  void insertAtIndexInWilayasList(int index, String item) =>
      wilayasList.insert(index, item);
  void updateWilayasListAtIndex(int index, Function(String) updateFn) =>
      wilayasList[index] = updateFn(wilayasList[index]);

  bool communeAnimation = true;

  bool centerAnimation = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get Wilayas)] action in placeordersheet widget.
  ApiCallResponse? wilayasListOnInit;
  // Stores action output result for [Backend Call - API (get Communes By Wilaya Name)] action in placeordersheet widget.
  ApiCallResponse? communesListOnInit;
  // Stores action output result for [Backend Call - API (Get Centers)] action in placeordersheet widget.
  ApiCallResponse? centersResponseOnInit;
  // State field(s) for firstNamefield widget.
  FocusNode? firstNamefieldFocusNode;
  TextEditingController? firstNamefieldTextController;
  String? Function(BuildContext, String?)?
      firstNamefieldTextControllerValidator;
  String? _firstNamefieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for LastNamefield widget.
  FocusNode? lastNamefieldFocusNode;
  TextEditingController? lastNamefieldTextController;
  String? Function(BuildContext, String?)? lastNamefieldTextControllerValidator;
  String? _lastNamefieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for phonefield widget.
  FocusNode? phonefieldFocusNode;
  TextEditingController? phonefieldTextController;
  String? Function(BuildContext, String?)? phonefieldTextControllerValidator;
  String? _phonefieldTextControllerValidator(
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

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (get All Communes)] action in RadioButton widget.
  ApiCallResponse? communesListOSelect2;
  // Stores action output result for [Backend Call - API (get Communes By Wilaya Name)] action in RadioButton widget.
  ApiCallResponse? communesListOSelect;
  // State field(s) for WilayasDD widget.
  String? wilayasDDValue;
  FormFieldController<String>? wilayasDDValueController;
  // Stores action output result for [Backend Call - API (get Communes By Wilaya Name)] action in WilayasDD widget.
  ApiCallResponse? getCommunesResponse;
  // State field(s) for CommuneDD widget.
  String? communeDDValue;
  FormFieldController<String>? communeDDValueController;
  // Stores action output result for [Backend Call - API (Get Centers)] action in CommuneDD widget.
  ApiCallResponse? centersRespons;
  // State field(s) for CentreDD widget.
  String? centreDDValue;
  FormFieldController<String>? centreDDValueController;
  // Stores action output result for [Backend Call - API (Calculate Total Fees)] action in Button widget.
  ApiCallResponse? calculateFees;

  @override
  void initState(BuildContext context) {
    firstNamefieldTextControllerValidator =
        _firstNamefieldTextControllerValidator;
    lastNamefieldTextControllerValidator =
        _lastNamefieldTextControllerValidator;
    phonefieldTextControllerValidator = _phonefieldTextControllerValidator;
  }

  @override
  void dispose() {
    firstNamefieldFocusNode?.dispose();
    firstNamefieldTextController?.dispose();

    lastNamefieldFocusNode?.dispose();
    lastNamefieldTextController?.dispose();

    phonefieldFocusNode?.dispose();
    phonefieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
