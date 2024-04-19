import '/components/settigsbuttomsheet/settigsbuttomsheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_page_widget.dart' show SettingsPageWidget;
import 'package:flutter/material.dart';

class SettingsPageModel extends FlutterFlowModel<SettingsPageWidget> {
  ///  Local state fields for this page.

  int totalitems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for settigsbuttomsheet component.
  late SettigsbuttomsheetModel settigsbuttomsheetModel;

  @override
  void initState(BuildContext context) {
    settigsbuttomsheetModel =
        createModel(context, () => SettigsbuttomsheetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    settigsbuttomsheetModel.dispose();
  }
}
