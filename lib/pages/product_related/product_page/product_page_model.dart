import '/app_bars/app_bar_favorites_page/app_bar_favorites_page_widget.dart';
import '/app_bars/app_bar_product_page/app_bar_product_page_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  int totalItems = 0;

  List<String> productGallery = [];
  void addToProductGallery(String item) => productGallery.add(item);
  void removeFromProductGallery(String item) => productGallery.remove(item);
  void removeAtIndexFromProductGallery(int index) =>
      productGallery.removeAt(index);
  void insertAtIndexInProductGallery(int index, String item) =>
      productGallery.insert(index, item);
  void updateProductGalleryAtIndex(int index, Function(String) updateFn) =>
      productGallery[index] = updateFn(productGallery[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Prepare CART)] action in ProductPage widget.
  ApiCallResponse? fetchCartData;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;

  int carouselCurrentIndex1 = 1;

  // Model for AppBarProductPage component.
  late AppBarProductPageModel appBarProductPageModel;
  // State field(s) for QtyCuonter widget.
  int? qtyCuonterValue1;
  // State field(s) for Carousel widget.
  CarouselController? carouselController2;

  int carouselCurrentIndex2 = 1;

  // Model for AppBarFavoritesPage component.
  late AppBarFavoritesPageModel appBarFavoritesPageModel1;
  // State field(s) for QtyCuonter widget.
  int? qtyCuonterValue2;
  // State field(s) for Carousel widget.
  CarouselController? carouselController3;

  int carouselCurrentIndex3 = 1;

  // Model for AppBarFavoritesPage component.
  late AppBarFavoritesPageModel appBarFavoritesPageModel2;
  // State field(s) for QtyCuonter widget.
  int? qtyCuonterValue3;
  // Stores action output result for [Backend Call - API (Prepare CART)] action in Button widget.
  ApiCallResponse? apiResultq7o;

  @override
  void initState(BuildContext context) {
    appBarProductPageModel =
        createModel(context, () => AppBarProductPageModel());
    appBarFavoritesPageModel1 =
        createModel(context, () => AppBarFavoritesPageModel());
    appBarFavoritesPageModel2 =
        createModel(context, () => AppBarFavoritesPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarProductPageModel.dispose();
    appBarFavoritesPageModel1.dispose();
    appBarFavoritesPageModel2.dispose();
  }
}
