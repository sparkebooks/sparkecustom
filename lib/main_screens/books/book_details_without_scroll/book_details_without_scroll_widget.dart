import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/rewards_screen.dart';
import 'package:sparke_kaleo/new_components/rewards_screen/src/utils/coin_icon.dart';

import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_components/loading_states/loading_page/loading_page_widget.dart';
import 'book_details_without_scroll_model.dart';

export 'book_details_without_scroll_model.dart';

class BookDetailsWithoutScrollWidget extends StatefulWidget {
  const BookDetailsWithoutScrollWidget({
    super.key,
    required this.userbookData,
    bool? isFromSparkeBooks,
  }) : isFromSparkeBooks = isFromSparkeBooks ?? false;

  final UserBooksDataStruct? userbookData;
  final bool isFromSparkeBooks;

  static String routeName = 'book_details_without_scroll';
  static String routePath = 'bookDetailsWithoutScroll';

  @override
  State<BookDetailsWithoutScrollWidget> createState() =>
      _BookDetailsWithoutScrollWidgetState();
}

class _BookDetailsWithoutScrollWidgetState
    extends State<BookDetailsWithoutScrollWidget> {
  late BookDetailsWithoutScrollModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    log('---------------------------------------  INIT  ---------------------------------------');

    super.initState();
    _model = createModel(context, () => BookDetailsWithoutScrollModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.bookref = await BooksTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.userbookData?.bookId,
            ),
          );
        }),
        Future(() async {
          _model.userbookref = await UserBooksTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.userbookData?.userbookId,
            ),
          );
        }),
      ]);
      _model.unlockedChapters =
          _model.userbookref!.firstOrNull!.chaptersUnlocked;
      safeSetState(() {});
      await UserBooksTable().update(
        data: {
          'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          widget.userbookData?.userbookId,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: _WithRewardScreenButton(
          child: FutureBuilder<List<ChaptersRow>>(
            future: FFAppState().chaptersQuery(
              uniqueQueryKey: valueOrDefault<String>(
                widget.userbookData?.userbookId.toString(),
                '0',
              ),
              requestFn: () => ChaptersTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'book_id',
                      widget.userbookData?.bookId,
                    )
                    .order('chapter_order', ascending: true),
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return LoadingPageWidget(
                  showTop: true,
                  bookTitle: widget.userbookData?.bookName,
                );
              }
              List<ChaptersRow> chaptersQueryChaptersRowList = snapshot.data!;

              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    if ((_model.bookref != null &&
                            (_model.bookref)!.isNotEmpty) &&
                        (_model.userbookref != null &&
                            (_model.userbookref)!.isNotEmpty)) {
                      return custom_widgets.BookReader(
                        width: double.infinity,
                        height: double.infinity,
                        chapters: chaptersQueryChaptersRowList,
                        userbookData: widget.userbookData!,
                        bookRef: _model.bookref?.firstOrNull,
                        userbookRef: _model.userbookref?.firstOrNull,
                        isFromSparkeBooks: widget.isFromSparkeBooks,
                      );
                    } else {
                      return wrapWithModel(
                        model: _model.loadingPageModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingPageWidget(),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _WithRewardScreenButton extends StatelessWidget {
  final Widget child;
  const _WithRewardScreenButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: child,
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: _RewardsButton(),
          ),
        ),
      ],
    );
  }
}

class _RewardsButton extends StatelessWidget {
  const _RewardsButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushRewardsScreen(),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: const [
            Text(
              'Unlock',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox.square(dimension: 30, child: CoinIcon()),
          ],
        ),
      ),
    );
  }
}
