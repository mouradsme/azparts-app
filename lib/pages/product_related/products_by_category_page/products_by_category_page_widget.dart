import '/app_bars/app_bar_category_page/app_bar_category_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_widget.dart';
import '/components/grid_product_component/grid_product_component_widget.dart';
import '/components/grid_product_componentrespo1/grid_product_componentrespo1_widget.dart';
import '/components/grid_product_componentrespo2/grid_product_componentrespo2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_by_category_page_model.dart';
export 'products_by_category_page_model.dart';

class ProductsByCategoryPageWidget extends StatefulWidget {
  const ProductsByCategoryPageWidget({
    super.key,
    required this.category,
  });

  final int? category;

  @override
  State<ProductsByCategoryPageWidget> createState() =>
      _ProductsByCategoryPageWidgetState();
}

class _ProductsByCategoryPageWidgetState
    extends State<ProductsByCategoryPageWidget> {
  late ProductsByCategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsByCategoryPageModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: FetchSubCategoriesOfACategoryByIDCall.call(
        id: widget.category,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: Color(0xFFF4CA00),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final productsByCategoryPageFetchSubCategoriesOfACategoryByIDResponse =
            snapshot.data!;
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.appBarCategoryPageModel,
                        updateCallback: () => setState(() {}),
                        child: const AppBarCategoryPageWidget(),
                      ),
                    ),
                    if (FetchSubCategoriesOfACategoryByIDCall.subCats(
                              productsByCategoryPageFetchSubCategoriesOfACategoryByIDResponse
                                  .jsonBody,
                            ) !=
                            null &&
                        (FetchSubCategoriesOfACategoryByIDCall.subCats(
                          productsByCategoryPageFetchSubCategoriesOfACategoryByIDResponse
                              .jsonBody,
                        ))!
                            .isNotEmpty)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 123.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final categoryItem = getJsonField(
                                  productsByCategoryPageFetchSubCategoriesOfACategoryByIDResponse
                                      .jsonBody,
                                  r'''$.data''',
                                ).toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categoryItem.length,
                                  itemBuilder: (context, categoryItemIndex) {
                                    final categoryItemItem =
                                        categoryItem[categoryItemIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'ProductsByCategoryPage',
                                                queryParameters: {
                                                  'category': serializeParam(
                                                    getJsonField(
                                                      categoryItemItem,
                                                      r'''$.id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 225.0,
                                              height: 110.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      17.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              categoryItemItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      25.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    Flexible(
                      flex: 10,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
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
                                                FetchProductsByCategoryIDCall
                                                    .call(
                                              id: widget.category,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCircle(
                                            color: Color(0xFFF4CA00),
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final gridViewFetchProductsByCategoryIDResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final results = getJsonField(
                                          gridViewFetchProductsByCategoryIDResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (results.isEmpty) {
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
                                            itemCount: results.length,
                                            itemBuilder:
                                                (context, resultsIndex) {
                                              final resultsItem =
                                                  results[resultsIndex];
                                              return Hero(
                                                tag: 'productCover',
                                                transitionOnUserGestures: true,
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child:
                                                      GridProductComponentWidget(
                                                    key: Key(
                                                        'Keyl7e_${resultsIndex}_of_${results.length}'),
                                                    productImage: getJsonField(
                                                      resultsItem,
                                                      r'''$.gallery.original[0]''',
                                                    ).toString(),
                                                    productName: getJsonField(
                                                      resultsItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    productId: getJsonField(
                                                      resultsItem,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    productPrice: getJsonField(
                                                      resultsItem,
                                                      r'''$.price''',
                                                    ).toString(),
                                                    productDescription:
                                                        getJsonField(
                                                      resultsItem,
                                                      r'''$..description''',
                                                    ).toString(),
                                                    inStock: getJsonField(
                                                      resultsItem,
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
                                                FetchProductsByCategoryIDCall
                                                    .call(
                                              id: widget.category,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCircle(
                                            color: Color(0xFFF4CA00),
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final gridViewFetchProductsByCategoryIDResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final results = getJsonField(
                                          gridViewFetchProductsByCategoryIDResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (results.isEmpty) {
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
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.75,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: results.length,
                                            itemBuilder:
                                                (context, resultsIndex) {
                                              final resultsItem =
                                                  results[resultsIndex];
                                              return GridProductComponentrespo1Widget(
                                                key: Key(
                                                    'Keyd7f_${resultsIndex}_of_${results.length}'),
                                                productImage: getJsonField(
                                                  resultsItem,
                                                  r'''$.gallery[0]''',
                                                ).toString(),
                                                productName: getJsonField(
                                                  resultsItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                productId: getJsonField(
                                                  resultsItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                productPrice: getJsonField(
                                                  resultsItem,
                                                  r'''$.price''',
                                                ).toString(),
                                                productDescription:
                                                    getJsonField(
                                                  resultsItem,
                                                  r'''$..description''',
                                                ).toString(),
                                                inStock: getJsonField(
                                                  resultsItem,
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
                              tablet: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter3 ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(
                                                FetchProductsByCategoryIDCall
                                                    .call(
                                              id: widget.category,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCircle(
                                            color: Color(0xFFF4CA00),
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final gridViewFetchProductsByCategoryIDResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final results = getJsonField(
                                          gridViewFetchProductsByCategoryIDResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (results.isEmpty) {
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
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.8,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: results.length,
                                            itemBuilder:
                                                (context, resultsIndex) {
                                              final resultsItem =
                                                  results[resultsIndex];
                                              return GridProductComponentrespo2Widget(
                                                key: Key(
                                                    'Keyetp_${resultsIndex}_of_${results.length}'),
                                                productImage: getJsonField(
                                                  resultsItem,
                                                  r'''$.gallery[0]''',
                                                ).toString(),
                                                productName: getJsonField(
                                                  resultsItem,
                                                  r'''$.name''',
                                                ).toString(),
                                                productId: getJsonField(
                                                  resultsItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                productPrice: getJsonField(
                                                  resultsItem,
                                                  r'''$.price''',
                                                ).toString(),
                                                productDescription:
                                                    getJsonField(
                                                  resultsItem,
                                                  r'''$.description''',
                                                ).toString(),
                                                inStock: getJsonField(
                                                  resultsItem,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
