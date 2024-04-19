import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/shimmer_notif/shimmer_notif_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'notifications_shimmer_model.dart';
export 'notifications_shimmer_model.dart';

class NotificationsShimmerWidget extends StatefulWidget {
  const NotificationsShimmerWidget({super.key});

  @override
  State<NotificationsShimmerWidget> createState() =>
      _NotificationsShimmerWidgetState();
}

class _NotificationsShimmerWidgetState
    extends State<NotificationsShimmerWidget> {
  late NotificationsShimmerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsShimmerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().T3 = true;
        FFAppState().T4 = false;
        FFAppState().lastvi = 3;
        FFAppState().T1 = false;
        FFAppState().T2 = false;
      });
      _model.apiResulttx4 = await PrepareCARTCall.call(
        cartIdsList: FFAppState().cartItemsIds,
        cartQtysList: FFAppState().cartItemsQtys,
      );
      if ((_model.apiResulttx4?.succeeded ?? true)) {
        setState(() {
          _model.totalItems = getJsonField(
            (_model.apiResulttx4?.jsonBody ?? ''),
            r'''$.totalItems''',
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            model: _model.shimmerNotifModel,
            updateCallback: () => setState(() {}),
            child: const ShimmerNotifWidget(),
          ),
        ),
      ),
    );
  }
}
