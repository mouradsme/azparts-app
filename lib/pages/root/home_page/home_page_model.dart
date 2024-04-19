import '/app_bars/app_bar_for_home_page_component/app_bar_for_home_page_component_widget.dart';
import '/components/featured_component/featured_component_widget.dart';
import '/components/search_component/search_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/static_components/home_page_head_component/home_page_head_component_widget.dart';
import '/static_components/new_arrivals_component/new_arrivals_component_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBarForHomePageComponent component.
  late AppBarForHomePageComponentModel appBarForHomePageComponentModel;
  // Model for HomePageHeadComponent component.
  late HomePageHeadComponentModel homePageHeadComponentModel;
  // Model for SearchComponent component.
  late SearchComponentModel searchComponentModel;
  // Model for FeaturedComponent component.
  late FeaturedComponentModel featuredComponentModel;
  // Model for NewArrivalsComponent component.
  late NewArrivalsComponentModel newArrivalsComponentModel;

  @override
  void initState(BuildContext context) {
    appBarForHomePageComponentModel =
        createModel(context, () => AppBarForHomePageComponentModel());
    homePageHeadComponentModel =
        createModel(context, () => HomePageHeadComponentModel());
    searchComponentModel = createModel(context, () => SearchComponentModel());
    featuredComponentModel =
        createModel(context, () => FeaturedComponentModel());
    newArrivalsComponentModel =
        createModel(context, () => NewArrivalsComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarForHomePageComponentModel.dispose();
    homePageHeadComponentModel.dispose();
    searchComponentModel.dispose();
    featuredComponentModel.dispose();
    newArrivalsComponentModel.dispose();
  }
}
