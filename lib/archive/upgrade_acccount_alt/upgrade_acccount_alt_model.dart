import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/in_app_purchases/coinshop/ui_coins_popular/ui_coins_popular_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'upgrade_acccount_alt_widget.dart' show UpgradeAcccountAltWidget;
import 'package:flutter/material.dart';

class UpgradeAcccountAltModel
    extends FlutterFlowModel<UpgradeAcccountAltWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for ui_coins_popular component.
  late UiCoinsPopularModel uiCoinsPopularModel;

  @override
  void initState(BuildContext context) {
    uiCoinsPopularModel = createModel(context, () => UiCoinsPopularModel());
  }

  @override
  void dispose() {
    uiCoinsPopularModel.dispose();
  }
}
