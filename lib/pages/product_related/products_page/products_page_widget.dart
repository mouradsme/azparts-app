import '/app_bars/app_bar_all_product_page/app_bar_all_product_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_widget.dart';
import '/components/grid_product_component/grid_product_component_widget.dart';
import '/components/grid_product_componentrespo1/grid_product_componentrespo1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_page_model.dart';
export 'products_page_model.dart';

class ProductsPageWidget extends StatefulWidget {
  const ProductsPageWidget({super.key});

  @override
  State<ProductsPageWidget> createState() => _ProductsPageWidgetState();
}

class _ProductsPageWidgetState extends State<ProductsPageWidget> {
  late ProductsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      _model.apiResultq7o = await PrepareCARTCall.call(
        cartIdsList: FFAppState().cartItemsIds,
        cartQtysList: FFAppState().cartItemsQtys,
      );
      if ((_model.apiResultq7o?.succeeded ?? true)) {
        setState(() {
          _model.totalItems = getJsonField(
            (_model.apiResultq7o?.jsonBody ?? ''),
            r'''$.totalItems''',
          );
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
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.appBarAllProductPageModel,
                    updateCallback: () => setState(() {}),
                    child: const AppBarAllProductPageWidget(),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Tous les produits',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(
                                              FetchAllProductsCall.call()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final gridViewFetchAllProductsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final result = getJsonField(
                                        gridViewFetchAllProductsResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList();
                                      if (result.isEmpty) {
                                        return const EmptyListWidget();
                                      }
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 5.0,
                                            childAspectRatio: 0.6,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: result.length,
                                          itemBuilder: (context, resultIndex) {
                                            final resultItem =
                                                result[resultIndex];
                                            return Hero(
                                              tag: 'productCover',
                                              transitionOnUserGestures: true,
                                              child: Material(
                                                color: Colors.transparent,
                                                child:
                                                    GridProductComponentWidget(
                                                  key: Key(
                                                      'Keym18_${resultIndex}_of_${result.length}'),
                                                  productImage: getJsonField(
                                                            resultItem,
                                                            r'''$.gallery.thumb''',
                                                          ) !=
                                                          null
                                                      ? getJsonField(
                                                          resultItem,
                                                          r'''$.gallery.thumb[0]''',
                                                        ).toString()
                                                      : getJsonField(
                                                          resultItem,
                                                          r'''$.gallery.original[0]''',
                                                        ).toString(),
                                                  productName: getJsonField(
                                                    resultItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  productId: getJsonField(
                                                    resultItem,
                                                    r'''$.id''',
                                                  ).toString(),
                                                  productPrice: getJsonField(
                                                    resultItem,
                                                    r'''$.price''',
                                                  ).toString(),
                                                  productDescription:
                                                      getJsonField(
                                                    resultItem,
                                                    r'''$.description''',
                                                  ).toString(),
                                                  inStock: getJsonField(
                                                    resultItem,
                                                    r'''$.in_stock''',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter2 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(
                                              FetchAllProductsCall.call()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final gridViewFetchAllProductsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final result = getJsonField(
                                        gridViewFetchAllProductsResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList();
                                      if (result.isEmpty) {
                                        return const EmptyListWidget();
                                      }
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() => _model
                                              .apiRequestCompleter2 = null);
                                          await _model
                                              .waitForApiRequestCompleted2();
                                        },
                                        child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: result.length,
                                          itemBuilder: (context, resultIndex) {
                                            final resultItem =
                                                result[resultIndex];
                                            return GridProductComponentrespo1Widget(
                                              key: Key(
                                                  'Keyj67_${resultIndex}_of_${result.length}'),
                                              productImage: getJsonField(
                                                        resultItem,
                                                        r'''$.gallery.thumb''',
                                                      ) !=
                                                      null
                                                  ? getJsonField(
                                                      resultItem,
                                                      r'''$.gallery.thumb[0]''',
                                                    ).toString()
                                                  : getJsonField(
                                                      resultItem,
                                                      r'''$.gallery.original[0]''',
                                                    ).toString(),
                                              productName: getJsonField(
                                                resultItem,
                                                r'''$.name''',
                                              ).toString(),
                                              productId: getJsonField(
                                                resultItem,
                                                r'''$.id''',
                                              ).toString(),
                                              productPrice: getJsonField(
                                                resultItem,
                                                r'''$.price''',
                                              ).toString(),
                                              productDescription: getJsonField(
                                                resultItem,
                                                r'''$.description''',
                                              ).toString(),
                                              inStock: getJsonField(
                                                resultItem,
                                                r'''$.in_stock''',
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter3 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(
                                              FetchAllProductsCall.call()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final gridViewFetchAllProductsResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final result = getJsonField(
                                        gridViewFetchAllProductsResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList();
                                      if (result.isEmpty) {
                                        return const EmptyListWidget();
                                      }
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() => _model
                                              .apiRequestCompleter3 = null);
                                          await _model
                                              .waitForApiRequestCompleted3();
                                        },
                                        child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.65,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: result.length,
                                          itemBuilder: (context, resultIndex) {
                                            final resultItem =
                                                result[resultIndex];
                                            return Container(
                                                width: 100,
                                                height: 100,
                                                color: Colors.green);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
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
