import '/app_bars/app_bar_favorites_page/app_bar_favorites_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_widget.dart';
import '/components/grid_product_component/grid_product_component_widget.dart';
import '/components/grid_product_componentrespo1/grid_product_componentrespo1_widget.dart';
import '/components/grid_product_componentrespo2/grid_product_componentrespo2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_favorites_page_model.dart';
export 'product_favorites_page_model.dart';

class ProductFavoritesPageWidget extends StatefulWidget {
  const ProductFavoritesPageWidget({super.key});

  @override
  State<ProductFavoritesPageWidget> createState() =>
      _ProductFavoritesPageWidgetState();
}

class _ProductFavoritesPageWidgetState
    extends State<ProductFavoritesPageWidget> {
  late ProductFavoritesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFavoritesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
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
                    model: _model.appBarFavoritesPageModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: AppBarFavoritesPageWidget(
                      cartTotalItems: _model.totalItems,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Mes favoris',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
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
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: FetchFavoritedProductsCall.call(
                                      favoritesList: FFAppState().myFavorites,
                                    ),
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
                                      final gridViewFetchFavoritedProductsResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final result = getJsonField(
                                            gridViewFetchFavoritedProductsResponse
                                                .jsonBody,
                                            r'''$.data''',
                                          ).toList();
                                          if (result.isEmpty) {
                                            return const EmptyListWidget();
                                          }
                                          return GridView.builder(
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
                                            itemBuilder:
                                                (context, resultIndex) {
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
                                                        'Keyrk2_${resultIndex}_of_${result.length}'),
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
                                          );
                                        },
                                      );
                                    },
                                  ),
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
                                  future: FetchFavoritedProductsCall.call(
                                    favoritesList: FFAppState().myFavorites,
                                  ),
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
                                    final gridViewFetchFavoritedProductsResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final result = getJsonField(
                                          gridViewFetchFavoritedProductsResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (result.isEmpty) {
                                          return const EmptyListWidget();
                                        }
                                        return GridView.builder(
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
                                          itemCount: result.length,
                                          itemBuilder: (context, resultIndex) {
                                            final resultItem =
                                                result[resultIndex];
                                            return GridProductComponentrespo1Widget(
                                              key: Key(
                                                  'Keyndu_${resultIndex}_of_${result.length}'),
                                              productImage: getJsonField(
                                                resultItem,
                                                r'''$.gallery.thumb[0]''',
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
                                  future: FetchFavoritedProductsCall.call(
                                    favoritesList: FFAppState().myFavorites,
                                  ),
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
                                    final gridViewFetchFavoritedProductsResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final result = getJsonField(
                                          gridViewFetchFavoritedProductsResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (result.isEmpty) {
                                          return const EmptyListWidget();
                                        }
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.85,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: result.length,
                                          itemBuilder: (context, resultIndex) {
                                            final resultItem =
                                                result[resultIndex];
                                            return GridProductComponentrespo2Widget(
                                              key: Key(
                                                  'Keydt7_${resultIndex}_of_${result.length}'),
                                              productImage: getJsonField(
                                                resultItem,
                                                r'''$.gallery.thumb[0]''',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
