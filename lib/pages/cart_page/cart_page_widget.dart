import '/app_bars/app_bar_cart/app_bar_cart_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/cart_item_component/cart_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmers/shimmer_item_component/shimmer_item_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_page_model.dart';
export 'cart_page_model.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({super.key});

  @override
  State<CartPageWidget> createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late CartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      setState(() {
        FFAppState().T3 = false;
        FFAppState().T4 = false;
        FFAppState().lastvi = 2;
        FFAppState().T1 = false;
        FFAppState().T2 = true;
      });
      _model.updateCartRes = await PrepareCARTCall.call(
        cartIdsList: FFAppState().cartItemsIds,
        cartQtysList: FFAppState().cartItemsQtys,
      );
      setState(() {
        FFAppState().itemTotalPrices = [];
        FFAppState().itemTotalIds = [];
        FFAppState().itemTotalQtys = [];
      });
      if ((_model.updateCartRes?.succeeded ?? true)) {
        setState(() {
          _model.totalItems = getJsonField(
            (_model.updateCartRes?.jsonBody ?? ''),
            r'''$.totalItems''',
          );
          _model.totalPrice = getJsonField(
            (_model.updateCartRes?.jsonBody ?? ''),
            r'''$.totalPrice''',
          ).toString().toString();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.appBarCartModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: AppBarCartWidget(
                          cartTotalItems: _model.totalItems!,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        height: 31.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Text(
                          'My cart',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Poppins'),
                              ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.45,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: PrepareCARTCall.call(
                        cartIdsList: FFAppState().cartItemsIds,
                        cartQtysList: FFAppState().cartItemsQtys,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            child: const ShimmerItemComponentWidget(),
                          );
                        }
                        final listViewPrepareCARTResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final cartItem = getJsonField(
                              listViewPrepareCARTResponse.jsonBody,
                              r'''$.data''',
                            ).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: cartItem.length,
                              itemBuilder: (context, cartItemIndex) {
                                final cartItemItem = cartItem[cartItemIndex];
                                return CartItemComponentWidget(
                                  key: Key(
                                      'Keykb2_${cartItemIndex}_of_${cartItem.length}'),
                                  itemName: getJsonField(
                                    cartItemItem,
                                    r'''$.name''',
                                  ).toString(),
                                  itemImage: getJsonField(
                                            cartItemItem,
                                            r'''$.gallery.thumb''',
                                          ) !=
                                          null
                                      ? getJsonField(
                                          cartItemItem,
                                          r'''$.gallery.thumb[0]''',
                                        ).toString()
                                      : getJsonField(
                                          cartItemItem,
                                          r'''$.gallery.original[0]''',
                                        ).toString(),
                                  itemQty: getJsonField(
                                    cartItemItem,
                                    r'''$.cartQty''',
                                  ),
                                  itemPrice: getJsonField(
                                    cartItemItem,
                                    r'''$.price''',
                                  ).toString(),
                                  itemId: getJsonField(
                                    cartItemItem,
                                    r'''$.id''',
                                  ),
                                  itemDeleteAction: () async {
                                    _model.deletedAction =
                                        await PrepareCARTCall.call(
                                      cartIdsList: FFAppState().cartItemsIds,
                                      cartQtysList: FFAppState().cartItemsQtys,
                                    );
                                    if ((_model.deletedAction?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.totalItems = getJsonField(
                                          (_model.deletedAction?.jsonBody ??
                                              ''),
                                          r'''$.totalItems''',
                                        );
                                        _model.totalPrice = getJsonField(
                                          (_model.deletedAction?.jsonBody ??
                                              ''),
                                          r'''$.totalPrice''',
                                        ).toString();
                                      });
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('er'),
                                            content: Text(
                                                listViewPrepareCARTResponse
                                                    .bodyText),
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

                                    setState(() {});
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 10.69),
                                child: FFButtonWidget(
                                  onPressed: !FFAppState().CartUpdated
                                      ? null
                                      : () async {
                                          FFAppState().update(() {
                                            FFAppState().CartUpdated = false;
                                          });
                                          _model.updateCartResOnClick =
                                              await PrepareCARTCall.call(
                                            cartIdsList:
                                                FFAppState().cartItemsIds,
                                            cartQtysList:
                                                FFAppState().cartItemsQtys,
                                          );
                                          if ((_model.updateCartResOnClick
                                                  ?.succeeded ??
                                              true)) {
                                            setState(() {
                                              _model.totalItems = getJsonField(
                                                (_model.updateCartResOnClick
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.totalItems''',
                                              );
                                              _model.totalPrice = getJsonField(
                                                (_model.updateCartResOnClick
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.totalPrice''',
                                              ).toString();
                                            });
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Error'),
                                                  content: const Text('Error'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                  text: 'Update Cart',
                                  icon: Icon(
                                    Icons.upgrade,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: 32.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Poppins'),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    disabledColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        height: 23.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_model.totalItems?.toString()} Items',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Poppins'),
                                  ),
                            ),
                            Text(
                              '${_model.totalPrice} DZD',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Poppins'),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
                      child: Container(
                        width: 250.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: FFButtonWidget(
                          onPressed: (_model.totalItems == 0)
                              ? null
                              : () async {
                                  if (FFAppState().CartUpdated) {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('Proceed'),
                                                  content: const Text(
                                                      'Proceed To Checkout without updating the cart?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Back'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Proceed'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      context.pushNamed(
                                        'CheckoutPage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      return;
                                    }

                                    return;
                                  } else {
                                    context.pushNamed('deliveryinfos');
                                  }
                                },
                          text: 'Vers la caisse',
                          icon: const FaIcon(
                            FontAwesomeIcons.arrowAltCircleRight,
                          ),
                          options: FFButtonOptions(
                            height: 30.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
