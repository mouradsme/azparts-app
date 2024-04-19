import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_component_model.dart';
export 'cart_item_component_model.dart';

class CartItemComponentWidget extends StatefulWidget {
  const CartItemComponentWidget({
    super.key,
    required this.itemPrice,
    String? itemName,
    required this.itemImage,
    int? itemQty,
    required this.itemId,
    this.itemDeleteAction,
  })  : itemName = itemName ?? 'Name',
        itemQty = itemQty ?? 1;

  final String? itemPrice;
  final String itemName;
  final String? itemImage;
  final int itemQty;
  final int? itemId;
  final Future Function()? itemDeleteAction;

  @override
  State<CartItemComponentWidget> createState() =>
      _CartItemComponentWidgetState();
}

class _CartItemComponentWidgetState extends State<CartItemComponentWidget> {
  late CartItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.itemTotalPrice =
            widget.itemQty * double.parse((widget.itemPrice!));
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 16.0),
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 107.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.69, 10.69, 6.5, 10.69),
                        child: Container(
                          width: 85.2,
                          height: 85.5,
                          decoration: BoxDecoration(
                            color: const Color(0xFFA37979),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      widget.itemImage!,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: widget.itemImage!,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: widget.itemImage!,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  widget.itemImage!,
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.69, 0.0, 0.0),
                        child: Text(
                          widget.itemName,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Text(
                          '${widget.itemPrice}DA',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFF666666),
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Total: ${_model.itemTotalPrice.toString()}DA'
                              .maybeHandleOverflow(
                            maxChars: 20,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFF666666),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 5.0),
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                width: 90.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(7.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: const Color(0x0014181B),
                                    width: 0.0,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.solidMinusSquare,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 25.0,
                                  ),
                                  incrementIconBuilder: (enabled) => Icon(
                                    Icons.add_box,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    size: 25.0,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily),
                                        ),
                                  ),
                                  count: _model.qtycartValue ??= widget.itemQty,
                                  updateCount: (count) async {
                                    setState(() => _model.qtycartValue = count);
                                    FFAppState().update(() {
                                      FFAppState().CartUpdated = true;
                                    });
                                    FFAppState().update(() {
                                      FFAppState().updateCartItemsQtysAtIndex(
                                        functions.getItemIdIndex(
                                            FFAppState().cartItemsIds.toList(),
                                            widget.itemId!)!,
                                        (_) => _model.qtycartValue!,
                                      );
                                    });
                                    _model.updatePage(() {
                                      _model.itemTotalPrice =
                                          valueOrDefault<double>(
                                        double.parse((widget.itemPrice!)) *
                                            valueOrDefault<int>(
                                              _model.qtycartValue,
                                              0,
                                            ),
                                        0.0,
                                      );
                                    });
                                  },
                                  stepSize: 1,
                                  minimum: 1,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var shouldSetState = false;
                                _model.updatePage(() {
                                  _model.itemIndex = functions.getItemIdIndex(
                                      FFAppState().cartItemsIds.toList(),
                                      widget.itemId!);
                                });
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Remove from cart'),
                                              content: const Text(
                                                  'Do you really want to remove the item from the cart?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: const Text('Yes'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  _model.updatePage(() {
                                    FFAppState().removeAtIndexFromCartItemsIds(
                                        _model.itemIndex!);
                                    FFAppState().removeAtIndexFromCartItemsQtys(
                                        _model.itemIndex!);
                                  });
                                  _model.afterDelete =
                                      await PrepareCARTCall.call(
                                    cartIdsList: FFAppState().cartItemsIds,
                                    cartQtysList: FFAppState().cartItemsQtys,
                                  );
                                  shouldSetState = true;
                                  if ((_model.afterDelete?.succeeded ?? true)) {
                                    FFAppState().update(() {
                                      FFAppState().cartCurrentDeleted =
                                          FFAppState().cartCurrentDeleted + 1;
                                    });
                                    await widget.itemDeleteAction?.call();
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Error'),
                                          content: const Text('Error'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              text: '',
                              icon: const Icon(
                                Icons.delete,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                width: 68.0,
                                height: 40.0,
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 8.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 5.0))
                          .around(const SizedBox(height: 5.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
