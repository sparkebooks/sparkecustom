import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_screens/books/book_components/book_current_reading/book_current_reading_widget.dart';
import '/main_screens/books/book_components/book_list_large/book_list_large_widget.dart';
import '/new_components/list_header_view/list_header_view_widget.dart';
import '/new_components/section_trope_just_out/section_trope_just_out_widget.dart';
import '/new_components/section_trope_popular_today/section_trope_popular_today_widget.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'main_home_widget.dart' show MainHomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainHomeModel extends FlutterFlowModel<MainHomeWidget> {
  ///  Local state fields for this page.

  int loopAddIndex = 0;

  bool isBottomsheetOpen = false;

  int loopCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in main_home widget.
  UsersRecord? firebaseUser;
  // Stores action output result for [Backend Call - Query Rows] action in main_home widget.
  List<UserBooksRow>? myUserBooks;
  // Stores action output result for [Backend Call - Query Rows] action in main_home widget.
  List<BooksRow>? bookCopy;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Models for book_list_large dynamic component.
  late FlutterFlowDynamicModels<BookListLargeModel> bookListLargeModels;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UserBooksRow>? userBookData;
  // Model for book_current_reading component.
  late BookCurrentReadingModel bookCurrentReadingModel1;
  // Model for list_header_view component.
  late ListHeaderViewModel listHeaderViewModel;
  // Models for book_current_reading dynamic component.
  late FlutterFlowDynamicModels<BookCurrentReadingModel>
      bookCurrentReadingModels2;
  // Model for section_trope_just_out component.
  late SectionTropeJustOutModel sectionTropeJustOutModel;
  // Model for section_trope_PopularToday component.
  late SectionTropePopularTodayModel sectionTropePopularTodayModel;

  /// Query cache managers for this widget.

  final _homeBannersManager = FutureRequestManager<List<HomeAdsRow>>();
  Future<List<HomeAdsRow>> homeBanners({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<HomeAdsRow>> Function() requestFn,
  }) =>
      _homeBannersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomeBannersCache() => _homeBannersManager.clear();
  void clearHomeBannersCacheKey(String? uniqueKey) =>
      _homeBannersManager.clearRequest(uniqueKey);

  final _bannerBookManager = FutureRequestManager<List<BooksRow>>();
  Future<List<BooksRow>> bannerBook({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BooksRow>> Function() requestFn,
  }) =>
      _bannerBookManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBannerBookCache() => _bannerBookManager.clear();
  void clearBannerBookCacheKey(String? uniqueKey) =>
      _bannerBookManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    bookListLargeModels = FlutterFlowDynamicModels(() => BookListLargeModel());
    bookCurrentReadingModel1 =
        createModel(context, () => BookCurrentReadingModel());
    listHeaderViewModel = createModel(context, () => ListHeaderViewModel());
    bookCurrentReadingModels2 =
        FlutterFlowDynamicModels(() => BookCurrentReadingModel());
    sectionTropeJustOutModel =
        createModel(context, () => SectionTropeJustOutModel());
    sectionTropePopularTodayModel =
        createModel(context, () => SectionTropePopularTodayModel());
  }

  @override
  void dispose() {
    bookListLargeModels.dispose();
    bookCurrentReadingModel1.dispose();
    listHeaderViewModel.dispose();
    bookCurrentReadingModels2.dispose();
    sectionTropeJustOutModel.dispose();
    sectionTropePopularTodayModel.dispose();

    /// Dispose query cache managers for this widget.

    clearHomeBannersCache();

    clearBannerBookCache();
  }
}
