import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/shimmer_item_component/shimmer_item_component_widget.dart';
import 'shimmer_cart_item_component_widget.dart'
    show ShimmerCartItemComponentWidget;
import 'package:flutter/material.dart';

class ShimmerCartItemComponentModel
    extends FlutterFlowModel<ShimmerCartItemComponentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ShimmerItemComponent component.
  late ShimmerItemComponentModel shimmerItemComponentModel;

  @override
  void initState(BuildContext context) {
    shimmerItemComponentModel =
        createModel(context, () => ShimmerItemComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    shimmerItemComponentModel.dispose();
  }
}
