import '/app_bars/app_bar_favorites_page/app_bar_favorites_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:flutter/material.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBarFavoritesPage component.
  late AppBarFavoritesPageModel appBarFavoritesPageModel;

  @override
  void initState(BuildContext context) {
    appBarFavoritesPageModel =
        createModel(context, () => AppBarFavoritesPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarFavoritesPageModel.dispose();
  }
}
