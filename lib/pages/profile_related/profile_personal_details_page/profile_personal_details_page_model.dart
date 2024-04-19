import '/app_bars/app_bar_profil_details/app_bar_profil_details_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_personal_details_page_widget.dart'
    show ProfilePersonalDetailsPageWidget;
import 'package:flutter/material.dart';

class ProfilePersonalDetailsPageModel
    extends FlutterFlowModel<ProfilePersonalDetailsPageWidget> {
  ///  Local state fields for this page.

  bool editMode = false;

  int totalitems = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Prepare CART)] action in ProfilePersonalDetailsPage widget.
  ApiCallResponse? apiResultq7o;
  // Model for AppBarProfilDetails component.
  late AppBarProfilDetailsModel appBarProfilDetailsModel;
  // State field(s) for FirstNameField widget.
  FocusNode? firstNameFieldFocusNode;
  TextEditingController? firstNameFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameFieldTextControllerValidator;
  // State field(s) for LastNameField widget.
  FocusNode? lastNameFieldFocusNode;
  TextEditingController? lastNameFieldTextController;
  String? Function(BuildContext, String?)? lastNameFieldTextControllerValidator;
  // State field(s) for PhoneNumberField widget.
  FocusNode? phoneNumberFieldFocusNode;
  TextEditingController? phoneNumberFieldTextController;
  String? Function(BuildContext, String?)?
      phoneNumberFieldTextControllerValidator;
  // State field(s) for AddressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldTextController;
  String? Function(BuildContext, String?)? addressFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    appBarProfilDetailsModel =
        createModel(context, () => AppBarProfilDetailsModel());
  }

  @override
  void dispose() {
    appBarProfilDetailsModel.dispose();
    firstNameFieldFocusNode?.dispose();
    firstNameFieldTextController?.dispose();

    lastNameFieldFocusNode?.dispose();
    lastNameFieldTextController?.dispose();

    phoneNumberFieldFocusNode?.dispose();
    phoneNumberFieldTextController?.dispose();

    addressFieldFocusNode?.dispose();
    addressFieldTextController?.dispose();
  }
}
