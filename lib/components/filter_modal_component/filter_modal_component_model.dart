import '/backend/api_requests/api_calls.dart';
import '/components/dynamic_filter_value_component/dynamic_filter_value_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_modal_component_widget.dart' show FilterModalComponentWidget;
import 'package:flutter/material.dart';

class FilterModalComponentModel
    extends FlutterFlowModel<FilterModalComponentWidget> {
  ///  Local state fields for this component.

  int? filterIndex = 0;

  List<int> filtersList = [];
  void addToFiltersList(int item) => filtersList.add(item);
  void removeFromFiltersList(int item) => filtersList.remove(item);
  void removeAtIndexFromFiltersList(int index) => filtersList.removeAt(index);
  void insertAtIndexInFiltersList(int index, int item) =>
      filtersList.insert(index, item);
  void updateFiltersListAtIndex(int index, Function(int) updateFn) =>
      filtersList[index] = updateFn(filtersList[index]);

  List<double> filtersValues = [];
  void addToFiltersValues(double item) => filtersValues.add(item);
  void removeFromFiltersValues(double item) => filtersValues.remove(item);
  void removeAtIndexFromFiltersValues(int index) =>
      filtersValues.removeAt(index);
  void insertAtIndexInFiltersValues(int index, double item) =>
      filtersValues.insert(index, item);
  void updateFiltersValuesAtIndex(int index, Function(double) updateFn) =>
      filtersValues[index] = updateFn(filtersValues[index]);

  String testValue = 'No Value';

  bool filterButtonClicked = false;

  int emptyFields = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownfiltre widget.
  String? dropDownfiltreValue;
  FormFieldController<String>? dropDownfiltreValueController;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // State field(s) for toL widget.
  FocusNode? toLFocusNode;
  TextEditingController? toLTextController;
  String? Function(BuildContext, String?)? toLTextControllerValidator;
  // Models for DynamicFilterValueComponent dynamic component.
  late FlutterFlowDynamicModels<DynamicFilterValueComponentModel>
      dynamicFilterValueComponentModels;
  // Stores action output result for [Backend Call - API (Fetch Attributes That Belong To Given Category by name)] action in Button widget.
  ApiCallResponse? attrs;

  @override
  void initState(BuildContext context) {
    dynamicFilterValueComponentModels =
        FlutterFlowDynamicModels(() => DynamicFilterValueComponentModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    toLFocusNode?.dispose();
    toLTextController?.dispose();

    dynamicFilterValueComponentModels.dispose();
  }
}
