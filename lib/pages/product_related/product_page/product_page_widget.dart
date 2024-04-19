import '/app_bars/app_bar_favorites_page/app_bar_favorites_page_widget.dart';
import '/app_bars/app_bar_product_page/app_bar_product_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/cart_message/cart_message_widget.dart';
import '/components/description/description_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    super.key,
    required this.productId,
  });

  final String? productId;

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      _model.fetchCartData = await PrepareCARTCall.call(
        cartIdsList: FFAppState().cartItemsIds,
        cartQtysList: FFAppState().cartItemsQtys,
      );
      if ((_model.fetchCartData?.succeeded ?? true)) {
        setState(() {
          _model.totalItems = getJsonField(
            (_model.fetchCartData?.jsonBody ?? ''),
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
      future: FetchProductDataByIDCall.call(
        id: widget.productId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final productPageFetchProductDataByIDResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 376.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final galleryCarousel = (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                            productPageFetchProductDataByIDResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty
                                                      ? FetchProductDataByIDCall
                                                          .thumbGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        )
                                                      : FetchProductDataByIDCall
                                                          .originalGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        ))
                                                  ?.toList() ??
                                              [];
                                          return SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: CarouselSlider.builder(
                                              itemCount: galleryCarousel.length,
                                              itemBuilder: (context,
                                                  galleryCarouselIndex, _) {
                                                final galleryCarouselItem =
                                                    galleryCarousel[
                                                        galleryCarouselIndex];
                                                return Hero(
                                                  tag: FetchProductDataByIDCall
                                                          .originalGallery(
                                                    productPageFetchProductDataByIDResponse
                                                        .jsonBody,
                                                  )!
                                                      .first,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          FetchProductDataByIDCall
                                                                  .originalGallery(
                                                        productPageFetchProductDataByIDResponse
                                                            .jsonBody,
                                                      )!
                                                              .first,
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              carouselController:
                                                  _model.carouselController1 ??=
                                                      CarouselController(),
                                              options: CarouselOptions(
                                                initialPage: min(1,
                                                    galleryCarousel.length - 1),
                                                viewportFraction: 1.0,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex1 =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.9, 0.75),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                              productPageFetchProductDataByIDResponse
                                                  .jsonBody,
                                              r'''$.data[0].BrandIcon''',
                                            ).toString(),
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 35.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.appBarProductPageModel,
                                      updateCallback: () => setState(() {}),
                                      child: const AppBarProductPageWidget(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 346.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 10.0, 30.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: 180.0,
                                                  height: 74.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          getJsonField(
                                                            productPageFetchProductDataByIDResponse
                                                                .jsonBody,
                                                            r'''$.data[0].name''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Référence #${getJsonField(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                          r'''$.data[0].reference''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 145.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        if (getJsonField(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                          r'''$.data[0].in_stock''',
                                                        ))
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  height: 48.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0x0014181B),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowCountController(
                                                                    decrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .solidMinusSquare,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    incrementIconBuilder:
                                                                        (enabled) =>
                                                                            Icon(
                                                                      Icons
                                                                          .add_box,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    countBuilder:
                                                                        (count) =>
                                                                            Text(
                                                                      count
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                    count: _model
                                                                        .qtyCuonterValue1 ??= 1,
                                                                    updateCount:
                                                                        (count) =>
                                                                            setState(() =>
                                                                                _model.qtyCuonterValue1 = count),
                                                                    stepSize: 1,
                                                                    minimum: 1,
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              getJsonField(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                                r'''$.data[0].in_stock''',
                                                              )
                                                                  ? 'En stock'
                                                                  : 'Rupture de stock',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: getJsonField(
                                                                      productPageFetchProductDataByIDResponse
                                                                          .jsonBody,
                                                                      r'''$.data[0].in_stock''',
                                                                    )
                                                                        ? FlutterFlowTheme.of(context).primaryText
                                                                        : FlutterFlowTheme.of(context).error,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Poppins'),
                                                                  ),
                                                              minFontSize: 2.0,
                                                            ),
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  34.0, 0.0, 34.0, 10.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 95.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final attributes = getJsonField(
                                                  productPageFetchProductDataByIDResponse
                                                      .jsonBody,
                                                  r'''$.data[0].attributes''',
                                                ).toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        attributes.length,
                                                        (attributesIndex) {
                                                      final attributesItem =
                                                          attributes[
                                                              attributesIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.5),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    getJsonField(
                                                                  attributesItem,
                                                                  r'''$.gallery[0]''',
                                                                ).toString(),
                                                                width: 50.5,
                                                                height: 50.5,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              attributesItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: const Color(
                                                                      0xFFF4CA00),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                          Text(
                                                            '${getJsonField(
                                                              attributesItem,
                                                              r'''$.pivot.value''',
                                                            ).toString()} ${getJsonField(
                                                              attributesItem,
                                                              r'''$.unit''',
                                                            ).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                        ],
                                                      );
                                                    }).divide(
                                                        const SizedBox(width: 40.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  34.0, 0.0, 34.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              DescriptionWidget(
                                                            desc: getJsonField(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                              r'''$.data[0].description''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Text(
                                                  'Description',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Poppins'),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeInOut,
                                  width: double.infinity,
                                  height: 670.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final galleryCarousel = (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                            productPageFetchProductDataByIDResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty
                                                      ? FetchProductDataByIDCall
                                                          .thumbGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        )
                                                      : FetchProductDataByIDCall
                                                          .originalGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        ))
                                                  ?.toList() ??
                                              [];
                                          return SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: CarouselSlider.builder(
                                              itemCount: galleryCarousel.length,
                                              itemBuilder: (context,
                                                  galleryCarouselIndex, _) {
                                                final galleryCarouselItem =
                                                    galleryCarousel[
                                                        galleryCarouselIndex];
                                                return Hero(
                                                  tag: FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                            productPageFetchProductDataByIDResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty
                                                      ? (FetchProductDataByIDCall
                                                          .thumbGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        )![_model
                                                          .carouselCurrentIndex2])
                                                      : (FetchProductDataByIDCall
                                                          .originalGallery(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                        )![_model
                                                          .carouselCurrentIndex2]),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl: FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                    productPageFetchProductDataByIDResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              (FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ))!
                                                                  .isNotEmpty
                                                          ? (FetchProductDataByIDCall
                                                              .thumbGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            )![_model
                                                              .carouselCurrentIndex2])
                                                          : (FetchProductDataByIDCall
                                                              .originalGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            )![_model
                                                              .carouselCurrentIndex2]),
                                                      width: 300.0,
                                                      height: 370.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 300.0,
                                                        height: 370.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              carouselController:
                                                  _model.carouselController2 ??=
                                                      CarouselController(),
                                              options: CarouselOptions(
                                                initialPage: min(1,
                                                    galleryCarousel.length - 1),
                                                viewportFraction: 1.0,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex2 =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.9, 0.75),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                              productPageFetchProductDataByIDResponse
                                                  .jsonBody,
                                              r'''$.data[0].BrandIcon''',
                                            ).toString(),
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 35.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.appBarFavoritesPageModel1,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: AppBarFavoritesPageWidget(
                                        cartTotalItems: _model.totalItems,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 650.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(35.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 10.0, 30.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: 180.0,
                                                  height: 74.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    7.0),
                                                        child: Text(
                                                          getJsonField(
                                                            productPageFetchProductDataByIDResponse
                                                                .jsonBody,
                                                            r'''$.data[0].name''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Référence #${getJsonField(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                          r'''$.data[0].reference''',
                                                        ).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 145.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        if (getJsonField(
                                                          productPageFetchProductDataByIDResponse
                                                              .jsonBody,
                                                          r'''$.data[0].in_stock''',
                                                        ))
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  height: 48.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0x0014181B),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowCountController(
                                                                    decrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .solidMinusSquare,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    incrementIconBuilder:
                                                                        (enabled) =>
                                                                            Icon(
                                                                      Icons
                                                                          .add_box,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                    countBuilder:
                                                                        (count) =>
                                                                            Text(
                                                                      count
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleLargeFamily,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          ),
                                                                    ),
                                                                    count: _model
                                                                        .qtyCuonterValue2 ??= 1,
                                                                    updateCount:
                                                                        (count) =>
                                                                            setState(() =>
                                                                                _model.qtyCuonterValue2 = count),
                                                                    stepSize: 1,
                                                                    minimum: 1,
                                                                    contentPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: AutoSizeText(
                                                              getJsonField(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                                r'''$.data[0].in_stock''',
                                                              )
                                                                  ? 'En stock'
                                                                  : 'Rupture de stock',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: getJsonField(
                                                                      productPageFetchProductDataByIDResponse
                                                                          .jsonBody,
                                                                      r'''$.data[0].in_stock''',
                                                                    )
                                                                        ? FlutterFlowTheme.of(context).primaryText
                                                                        : FlutterFlowTheme.of(context).error,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Poppins'),
                                                                  ),
                                                              minFontSize: 2.0,
                                                            ),
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  34.0, 0.0, 34.0, 10.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 95.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final attributes = getJsonField(
                                                  productPageFetchProductDataByIDResponse
                                                      .jsonBody,
                                                  r'''$.data[0].attributes''',
                                                ).toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(
                                                        attributes.length,
                                                        (attributesIndex) {
                                                      final attributesItem =
                                                          attributes[
                                                              attributesIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.5),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    getJsonField(
                                                                  attributesItem,
                                                                  r'''$.gallery[0]''',
                                                                ).toString(),
                                                                width: 50.5,
                                                                height: 50.5,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              attributesItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: const Color(
                                                                      0xFFF4CA00),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                          Text(
                                                            '${getJsonField(
                                                              attributesItem,
                                                              r'''$.pivot.value''',
                                                            ).toString()} ${getJsonField(
                                                              attributesItem,
                                                              r'''$.unit''',
                                                            ).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Poppins'),
                                                                ),
                                                          ),
                                                        ],
                                                      );
                                                    }).divide(
                                                        const SizedBox(width: 40.0)),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  34.0, 0.0, 34.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  DescriptionWidget(
                                                                desc:
                                                                    getJsonField(
                                                                  productPageFetchProductDataByIDResponse
                                                                      .jsonBody,
                                                                  r'''$.data[0].description''',
                                                                ).toString(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Text(
                                                      'Description',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                          ),
                                                    ),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Stack(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOut,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 670.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final galleryCarousel = (FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                    productPageFetchProductDataByIDResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              (FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ))!
                                                                  .isNotEmpty
                                                          ? FetchProductDataByIDCall
                                                              .thumbGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            )
                                                          : FetchProductDataByIDCall
                                                              .originalGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            ))
                                                      ?.toList() ??
                                                  [];
                                              return SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: CarouselSlider.builder(
                                                  itemCount:
                                                      galleryCarousel.length,
                                                  itemBuilder: (context,
                                                      galleryCarouselIndex, _) {
                                                    final galleryCarouselItem =
                                                        galleryCarousel[
                                                            galleryCarouselIndex];
                                                    return Hero(
                                                      tag: FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                    productPageFetchProductDataByIDResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              (FetchProductDataByIDCall
                                                                      .thumbGallery(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                              ))!
                                                                  .isNotEmpty
                                                          ? (FetchProductDataByIDCall
                                                              .thumbGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            )![_model
                                                              .carouselCurrentIndex3])
                                                          : (FetchProductDataByIDCall
                                                              .originalGallery(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                            )![_model
                                                              .carouselCurrentIndex3]),
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl: FetchProductDataByIDCall
                                                                          .thumbGallery(
                                                                        productPageFetchProductDataByIDResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null &&
                                                                  (FetchProductDataByIDCall
                                                                          .thumbGallery(
                                                                    productPageFetchProductDataByIDResponse
                                                                        .jsonBody,
                                                                  ))!
                                                                      .isNotEmpty
                                                              ? (FetchProductDataByIDCall
                                                                  .thumbGallery(
                                                                  productPageFetchProductDataByIDResponse
                                                                      .jsonBody,
                                                                )![_model
                                                                  .carouselCurrentIndex3])
                                                              : (FetchProductDataByIDCall
                                                                  .originalGallery(
                                                                  productPageFetchProductDataByIDResponse
                                                                      .jsonBody,
                                                                )![_model
                                                                  .carouselCurrentIndex3]),
                                                          width: 300.0,
                                                          height: 370.0,
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 300.0,
                                                            height: 370.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  carouselController: _model
                                                          .carouselController3 ??=
                                                      CarouselController(),
                                                  options: CarouselOptions(
                                                    initialPage: min(
                                                        1,
                                                        galleryCarousel.length -
                                                            1),
                                                    viewportFraction: 1.0,
                                                    disableCenter: true,
                                                    enlargeCenterPage: true,
                                                    enlargeFactor: 0.25,
                                                    enableInfiniteScroll: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    autoPlay: false,
                                                    onPageChanged: (index, _) =>
                                                        _model.carouselCurrentIndex3 =
                                                            index,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.9, 0.75),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl: getJsonField(
                                                  productPageFetchProductDataByIDResponse
                                                      .jsonBody,
                                                  r'''$.data[0].BrandIcon''',
                                                ).toString(),
                                                width: 120.0,
                                                height: 120.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 35.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: wrapWithModel(
                                          model:
                                              _model.appBarFavoritesPageModel2,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: AppBarFavoritesPageWidget(
                                            cartTotalItems: _model.totalItems,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 650.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 10.0, 30.0, 2.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: Container(
                                                      width: 180.0,
                                                      height: 74.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        7.0),
                                                            child: Text(
                                                              getJsonField(
                                                                productPageFetchProductDataByIDResponse
                                                                    .jsonBody,
                                                                r'''$.data[0].name''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Poppins'),
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'Référence #${getJsonField(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                              r'''$.data[0].reference''',
                                                            ).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 145.0,
                                                        height: 90.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (getJsonField(
                                                              productPageFetchProductDataByIDResponse
                                                                  .jsonBody,
                                                              r'''$.data[0].in_stock''',
                                                            ))
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          90.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(7.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              const Color(0x0014181B),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          FlutterFlowCountController(
                                                                        decrementIconBuilder:
                                                                            (enabled) =>
                                                                                FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidMinusSquare,
                                                                          color: enabled
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        incrementIconBuilder:
                                                                            (enabled) =>
                                                                                Icon(
                                                                          Icons
                                                                              .add_box,
                                                                          color: enabled
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                        countBuilder:
                                                                            (count) =>
                                                                                Text(
                                                                          count
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                fontSize: 20.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                        count: _model
                                                                            .qtyCuonterValue3 ??= 1,
                                                                        updateCount:
                                                                            (count) =>
                                                                                setState(() => _model.qtyCuonterValue3 = count),
                                                                        stepSize:
                                                                            1,
                                                                        minimum:
                                                                            1,
                                                                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Flexible(
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  getJsonField(
                                                                    productPageFetchProductDataByIDResponse
                                                                        .jsonBody,
                                                                    r'''$.data[0].in_stock''',
                                                                  )
                                                                      ? 'En stock'
                                                                      : 'Rupture de stock',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: getJsonField(
                                                                          productPageFetchProductDataByIDResponse
                                                                              .jsonBody,
                                                                          r'''$.data[0].in_stock''',
                                                                        )
                                                                            ? FlutterFlowTheme.of(context).primaryText
                                                                            : FlutterFlowTheme.of(context).error,
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Poppins'),
                                                                      ),
                                                                  minFontSize:
                                                                      2.0,
                                                                ),
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
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      34.0, 0.0, 34.0, 10.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 95.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final attributes =
                                                        getJsonField(
                                                      productPageFetchProductDataByIDResponse
                                                          .jsonBody,
                                                      r'''$.data[0].attributes''',
                                                    ).toList();
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            attributes.length,
                                                            (attributesIndex) {
                                                          final attributesItem =
                                                              attributes[
                                                                  attributesIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.5),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        getJsonField(
                                                                      attributesItem,
                                                                      r'''$.gallery[0]''',
                                                                    ).toString(),
                                                                    width: 50.5,
                                                                    height:
                                                                        50.5,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  attributesItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: const Color(
                                                                          0xFFF4CA00),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Poppins'),
                                                                    ),
                                                              ),
                                                              Text(
                                                                '${getJsonField(
                                                                  attributesItem,
                                                                  r'''$.pivot.value''',
                                                                ).toString()} ${getJsonField(
                                                                  attributesItem,
                                                                  r'''$.unit''',
                                                                ).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Poppins'),
                                                                    ),
                                                              ),
                                                            ],
                                                          );
                                                        }).divide(const SizedBox(
                                                            width: 40.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      34.0, 0.0, 34.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  DescriptionWidget(
                                                                desc:
                                                                    getJsonField(
                                                                  productPageFetchProductDataByIDResponse
                                                                      .jsonBody,
                                                                  r'''$.data[0].description''',
                                                                ).toString(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Text(
                                                      'Description',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Prix',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFFAACCEE),
                                          fontSize: 9.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Poppins'),
                                        ),
                                  ),
                                  Text(
                                    '${getJsonField(
                                      productPageFetchProductDataByIDResponse
                                          .jsonBody,
                                      r'''$.data[0].price''',
                                    ).toString()} DA',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Poppins'),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  width: 175.0,
                                  height: 52.4,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: !getJsonField(
                                        productPageFetchProductDataByIDResponse
                                            .jsonBody,
                                        r'''$.data[0].in_stock''',
                                      )
                                          ? null
                                          : () async {
                                              FFAppState().update(() {
                                                FFAppState().addToCartItemsIds(
                                                    widget.productId!);
                                                FFAppState().addToCartItemsQtys(
                                                    _model.qtyCuonterValue1!);
                                              });
                                              _model.apiResultq7o =
                                                  await PrepareCARTCall.call(
                                                cartIdsList:
                                                    FFAppState().cartItemsIds,
                                                cartQtysList:
                                                    FFAppState().cartItemsQtys,
                                              );
                                              if ((_model.apiResultq7o
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  _model.totalItems =
                                                      getJsonField(
                                                    (_model.apiResultq7o
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.totalItems''',
                                                  );
                                                });
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
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

                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          const CartMessageWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              setState(() {});
                                            },
                                      text: 'Ajouter au panier',
                                      icon: const Icon(
                                        Icons.add_shopping_cart_rounded,
                                        size: 14.0,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
