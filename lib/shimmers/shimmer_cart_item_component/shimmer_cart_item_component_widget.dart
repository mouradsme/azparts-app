import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/shimmer_item_component/shimmer_item_component_widget.dart';
import 'package:flutter/material.dart';
import 'shimmer_cart_item_component_model.dart';
export 'shimmer_cart_item_component_model.dart';

class ShimmerCartItemComponentWidget extends StatefulWidget {
  const ShimmerCartItemComponentWidget({super.key});

  @override
  State<ShimmerCartItemComponentWidget> createState() =>
      _ShimmerCartItemComponentWidgetState();
}

class _ShimmerCartItemComponentWidgetState
    extends State<ShimmerCartItemComponentWidget> {
  late ShimmerCartItemComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerCartItemComponentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFB),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.shimmerItemComponentModel,
            updateCallback: () => setState(() {}),
            child: const ShimmerItemComponentWidget(),
          ),
        ),
      ),
    );
  }
}
