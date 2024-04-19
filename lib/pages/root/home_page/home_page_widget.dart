import '/app_bars/app_bar_for_home_page_component/app_bar_for_home_page_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/featured_component/featured_component_widget.dart';
import '/components/grid_product_component/grid_product_component_widget.dart';
import '/components/grid_product_componentrespo1/grid_product_componentrespo1_widget.dart';
import '/components/grid_product_componentrespo2/grid_product_componentrespo2_widget.dart';
import '/components/search_component/search_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/static_components/home_page_head_component/home_page_head_component_widget.dart';
import '/static_components/new_arrivals_component/new_arrivals_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      setState(() {
        FFAppState().T3 = false;
        FFAppState().T4 = false;
        FFAppState().lastvi = 1;
        FFAppState().T1 = true;
      });
      if (FFAppState().uuid == '') {
        setState(() {
          FFAppState().uuid = random_data.randomString(
            10,
            12,
            true,
            true,
            true,
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.appBarForHomePageComponentModel,
                    updateCallback: () => setState(() {}),
                    child: const AppBarForHomePageComponentWidget(),
                  ),
                ),
                wrapWithModel(
                  model: _model.homePageHeadComponentModel,
                  updateCallback: () => setState(() {}),
                  child: const HomePageHeadComponentWidget(),
                ),
                StickyHeader(
                  overlapHeaders: false,
                  header: wrapWithModel(
                    model: _model.searchComponentModel,
                    updateCallback: () => setState(() {}),
                    child: const SearchComponentWidget(),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'Catégories',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Poppins'),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.featuredComponentModel,
                        updateCallback: () => setState(() {}),
                        child: const FeaturedComponentWidget(),
                      ),
                      wrapWithModel(
                        model: _model.newArrivalsComponentModel,
                        updateCallback: () => setState(() {}),
                        child: const NewArrivalsComponentWidget(),
                      ),
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
                            future: FetchLatestProductsNewArrivalsCall.call(),
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
                              final gridViewFetchLatestProductsNewArrivalsResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final gridapi = getJsonField(
                                    gridViewFetchLatestProductsNewArrivalsResponse
                                        .jsonBody,
                                    r'''$.data''',
                                  ).toList();
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
                                    itemCount: gridapi.length,
                                    itemBuilder: (context, gridapiIndex) {
                                      final gridapiItem = gridapi[gridapiIndex];
                                      return Hero(
                                        tag: 'productCover',
                                        transitionOnUserGestures: true,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: GridProductComponentWidget(
                                            key: Key(
                                                'Key25f_${gridapiIndex}_of_${gridapi.length}'),
                                            productImage: getJsonField(
                                                      gridapiItem,
                                                      r'''$.gallery.thumb''',
                                                    ) !=
                                                    null
                                                ? getJsonField(
                                                    gridapiItem,
                                                    r'''$.gallery.thumb[0]''',
                                                  ).toString()
                                                : getJsonField(
                                                    gridapiItem,
                                                    r'''$.gallery.original[0]''',
                                                  ).toString(),
                                            productName: getJsonField(
                                              gridapiItem,
                                              r'''$.name''',
                                            ).toString(),
                                            productId: getJsonField(
                                              gridapiItem,
                                              r'''$.id''',
                                            ).toString(),
                                            productPrice: getJsonField(
                                              gridapiItem,
                                              r'''$.price''',
                                            ).toString(),
                                            productDescription: getJsonField(
                                              gridapiItem,
                                              r'''$.description''',
                                            ).toString(),
                                            inStock: getJsonField(
                                              gridapiItem,
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
                            future: FetchLatestProductsNewArrivalsCall.call(),
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
                              final gridrespoFetchLatestProductsNewArrivalsResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final gridapi = getJsonField(
                                    gridrespoFetchLatestProductsNewArrivalsResponse
                                        .jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 0.72,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: gridapi.length,
                                    itemBuilder: (context, gridapiIndex) {
                                      final gridapiItem = gridapi[gridapiIndex];
                                      return GridProductComponentrespo1Widget(
                                        key: Key(
                                            'Keyb3i_${gridapiIndex}_of_${gridapi.length}'),
                                        productImage: getJsonField(
                                          gridapiItem,
                                          r'''$.gallery[0]''',
                                        ).toString(),
                                        productName: getJsonField(
                                          gridapiItem,
                                          r'''$.name''',
                                        ).toString(),
                                        productId: getJsonField(
                                          gridapiItem,
                                          r'''$.id''',
                                        ).toString(),
                                        productPrice: getJsonField(
                                          gridapiItem,
                                          r'''$.price''',
                                        ).toString(),
                                        productDescription: getJsonField(
                                          gridapiItem,
                                          r'''$.description''',
                                        ).toString(),
                                        inStock: getJsonField(
                                          gridapiItem,
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
                            future: FetchLatestProductsNewArrivalsCall.call(),
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
                              final gridrespoFetchLatestProductsNewArrivalsResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final gridapi = getJsonField(
                                    gridrespoFetchLatestProductsNewArrivalsResponse
                                        .jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  return GridView.builder(
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
                                    itemCount: gridapi.length,
                                    itemBuilder: (context, gridapiIndex) {
                                      final gridapiItem = gridapi[gridapiIndex];
                                      return GridProductComponentrespo2Widget(
                                        key: Key(
                                            'Keyevx_${gridapiIndex}_of_${gridapi.length}'),
                                        productImage: getJsonField(
                                          gridapiItem,
                                          r'''$.gallery[0]''',
                                        ).toString(),
                                        productName: getJsonField(
                                          gridapiItem,
                                          r'''$.name''',
                                        ).toString(),
                                        productId: getJsonField(
                                          gridapiItem,
                                          r'''$.id''',
                                        ).toString(),
                                        productPrice: getJsonField(
                                          gridapiItem,
                                          r'''$.price''',
                                        ).toString(),
                                        productDescription: getJsonField(
                                          gridapiItem,
                                          r'''$.description''',
                                        ).toString(),
                                        inStock: getJsonField(
                                          gridapiItem,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
