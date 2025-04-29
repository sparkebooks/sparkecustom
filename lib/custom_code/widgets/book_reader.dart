// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sparke_kaleo/main_screens/books/book_components/modal_remove_library/modal_remove_library_widget.dart';
import 'package:sparke_kaleo/auth/firebase_auth/auth_util.dart';
import 'package:sparke_kaleo/new_components/loading_states/loading_page/loading_page_widget.dart';
import 'package:sparke_kaleo/flutter_flow/flutter_flow_icon_button.dart';
import 'package:sparke_kaleo/new_components/modal_font_style_update/modal_font_style_update_widget.dart';
import 'dart:developer';
import 'dart:async';
import 'package:sparke_kaleo/main_screens/in_app_purchases/unlock_page/modal_unlock_chapter/modal_unlock_chapter_widget.dart';
import '../../main_screens/in_app_purchases/unlock_page/modal_unlock_unauth_user/modal_unlock_unauth_user_widget.dart';

class PageContent {
  final int chapterIndex;
  final String content;
  final int pageNumber;
  final int totalPagesInChapter;
  final bool isChapterTitlePage;

  PageContent({
    required this.chapterIndex,
    required this.content,
    required this.pageNumber,
    required this.totalPagesInChapter,
    this.isChapterTitlePage = false,
  });
}

class BookReader extends StatefulWidget {
  final double? width;
  final double? height;
  final List<ChaptersRow> chapters;
  final UserBooksDataStruct userbookData;
  final BooksRow? bookRef;
  final UserBooksRow? userbookRef;
  final bool isFromSparkeBooks;

  const BookReader({
    super.key,
    this.height,
    this.width,
    required this.chapters,
    required this.userbookData,
    this.bookRef,
    this.userbookRef,
    required this.isFromSparkeBooks,
  });

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final PageController _pageController = PageController();
  final List<PageContent> _pages = [];

  int _unlockedChapters = 0;
  List<int> _freeChaptersList = [];
  double _bookProgress = 0.0;

  int _currentPageIndex = 0;
  int _currentChapter = 1;
  int _lastLoadedChapterIndex = -1;
  bool _isLoadingInitial = true;
  bool _isLoadingMore = false;
  bool _isNextTap = false;
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    FFAppState().readingMode = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updatedLocalUserBooks(widget.userbookData.userbookId);
      _initializeReader();
    });
  }

  Future<void> _initializeReader() async {
    setState(() {
      _currentChapter = widget.userbookData.currentChapter;
      _unlockedChapters = widget.userbookRef?.chaptersUnlocked ?? 0;
      _freeChaptersList = widget.chapters
          .where((e) => !(e.paymentRequired ?? false)) // Filter free chapters
          .map((e) => e.chapterOrder ?? 0) // Extract chapterOrder
          .toList(); // Convert to list

      // Add user-unlocked chapters to the list (from 1 up to _unlockedChapters)
      // This assumes chapters are numbered sequentially from 1
      for (int i = 1; i <= _unlockedChapters; i++) {
        // Only add the chapter if it's not already in the list (not free by default)
        if (!_freeChaptersList.contains(i)) {
          _freeChaptersList.add(i);
        }
      }

      // Sort the list to ensure it's in ascending order
      _freeChaptersList.sort();
      _isLoadingInitial = true;
    });
    _paywallBottomSheet();
    try {
      await _restoreReadingPosition();
      if (_pages.isEmpty) {
        await _loadInitialChapter();
      }
      _loadNextChapter();
    } catch (e) {
      print('Error initializing reader: $e');
      await _loadInitialChapter();
    } finally {
      // await Future.delayed(const Duration(seconds: 1));
      // await widget.onInit(
      //   _currentPageIndex,
      //   _pages[_currentPageIndex].isChapterTitlePage && _currentChapter != 1,
      //   _currentChapter,
      //   _calculateHybridProgress(),
      // );
      setState(() => _isLoadingInitial = false);
    }
  }

  Future<void> _loadInitialChapter() async {
    if (widget.chapters.isEmpty) {
      setState(() => _isLoadingInitial = false);
      return;
    }

    final firstChapterPages = await _paginateChapter(
      widget.chapters[0].content ?? '',
      0,
    );
    setState(() {
      _pages.addAll(firstChapterPages);
      _lastLoadedChapterIndex = 0;
      _isLoadingInitial = false;
    });
    _loadNextChapter();
  }

  Future<void> _loadNextChapter() async {
    if (_isLoadingMore ||
        _lastLoadedChapterIndex >= widget.chapters.length - 1) {
      return;
    }

    setState(() => _isLoadingMore = true);

    final nextChapterIndex = _lastLoadedChapterIndex + 1;
    final nextChapterPages = await _paginateChapter(
      widget.chapters[nextChapterIndex].content ?? '',
      nextChapterIndex,
    );

    setState(() {
      _pages.addAll(nextChapterPages);
      _lastLoadedChapterIndex = nextChapterIndex;
      _isLoadingMore = false;
    });

    if (_currentPageIndex > _pages.length - 5) {
      _loadNextChapter();
    }
  }

  Future<List<PageContent>> _paginateChapter(
      String content, int chapterIndex) async {
    List<PageContent> pages = [];
    final textPainter = TextPainter(textDirection: Directionality.of(context));

    // log(content);

    int actualChapterOrder = widget.chapters[chapterIndex].chapterOrder ?? 0;

    // Add chapter title page
    pages.add(PageContent(
      chapterIndex: actualChapterOrder,
      content: widget.chapters[chapterIndex].title ?? '',
      pageNumber: 0,
      totalPagesInChapter: 0,
      isChapterTitlePage: true,
    ));

    // Calculate available space
    final maxWidth = MediaQuery.of(context).size.width - 32;
    final maxHeight = _getBookContentHeight();

    // Split content into paragraphs
    final paragraphs = content.split('\n\n');

    String currentPageContent = '';
    double currentPageHeight = 0;
    int pageNumber = 1;

    for (int paraIndex = 0; paraIndex < paragraphs.length; paraIndex++) {
      final paragraph = paragraphs[paraIndex].trim();
      final words = paragraph.split(' ');
      String currentLine = '';

      for (int wordIndex = 0; wordIndex < words.length; wordIndex++) {
        final word = words[wordIndex];

        // Try adding the word to current content
        final testContent =
            currentPageContent.isEmpty ? word : '$currentPageContent $word';
        textPainter.text =
            TextSpan(text: testContent, style: _getFontTextStyle());
        textPainter.layout(maxWidth: maxWidth);

        // Check if word fits on current page
        if (textPainter.height <= maxHeight) {
          currentPageContent = testContent;
        } else {
          // Create new page
          pages.add(PageContent(
            chapterIndex: actualChapterOrder,
            content: currentPageContent,
            pageNumber: pageNumber++,
            totalPagesInChapter: 0,
          ));

          // Reset for new page
          currentPageContent = word;
        }

        // Check if we need a new page
        if (currentPageHeight > maxHeight) {
          // Don't leave single words behind
          if (currentLine.split(' ').length <= 2 &&
              wordIndex < words.length - 1) {
            // Move this word to next page
            currentLine = '';
          } else {
            currentPageContent += currentLine;
          }

          // Create new page
          if (currentPageContent.isNotEmpty) {
            pages.add(PageContent(
              chapterIndex: actualChapterOrder,
              content: currentPageContent,
              pageNumber: pageNumber++,
              totalPagesInChapter: 0,
            ));
          }

          // Reset for new page
          currentPageContent = currentLine.isNotEmpty ? '$currentLine\n' : '';
          currentPageHeight = 0;
        }
      }

      // Add remaining line if exists
      if (currentLine.isNotEmpty) {
        currentPageContent += '$currentLine\n';

        // Measure the line height
        textPainter.text =
            TextSpan(text: currentLine, style: _getFontTextStyle());
        textPainter.layout(maxWidth: maxWidth);
        currentPageHeight += textPainter.height;
      }

      // Add paragraph break if not the last paragraph
      if (paraIndex < paragraphs.length - 1) {
        currentPageContent += '\n\n';
        // currentPageHeight += textPainter.height;
      }
    }

    // Add final page if there's remaining content
    if (currentPageContent.isNotEmpty) {
      pages.add(PageContent(
        chapterIndex: actualChapterOrder,
        content: currentPageContent,
        pageNumber: pageNumber,
        totalPagesInChapter: 0,
      ));
    }

    // Update total pages count
    final totalPages = pages.length;
    return pages
        .map((page) => PageContent(
              chapterIndex: actualChapterOrder,
              content: page.content,
              pageNumber: page.pageNumber,
              totalPagesInChapter: totalPages,
              isChapterTitlePage: page.isChapterTitlePage,
            ))
        .toList();
  }

  Future<void> _saveReadingPosition() async {
    if (_pages.isEmpty || _currentPageIndex >= _pages.length) return;

    final currentPage = _pages[_currentPageIndex];
    final currentChapterId = widget.chapters[currentPage.chapterIndex].id;

    // Get the first and last few words of the current page for matching later
    final words = currentPage.content.split(' ');
    final firstWords = words.take(10).join(' '); // Take first 5 words

    try {
      await SupaFlow.client
          .from('user_books')
          .update({
            'chapter_id': currentChapterId,
            'chapter_index': currentPage.chapterIndex,
            'page_number': _currentPageIndex,
            'pages_in_chapter': currentPage.totalPagesInChapter,
            'chapter_id_index': currentPage.pageNumber,
            'updated_at': DateTime.now().toIso8601String(),
            'last_visited_word_index': firstWords,
          })
          .eq('book_id', widget.userbookData.bookId)
          .eq('firebase_user_id', currentUserReference!.id);
    } catch (e) {
      print('Error saving reading position: $e');
    }
  }

  Future<void> _restoreReadingPosition() async {
    try {
      final response = await SupaFlow.client
          .from('user_books')
          .select()
          .eq('book_id', widget.userbookData.bookId)
          .eq('firebase_user_id', currentUserReference!.id)
          .single();

      if (response == null) return;

      final savedChapterIndex = response['chapter_index'] as int?;
      final savedPageNumber = response['page_number'] as int?;
      final savedFirstWords = response['last_visited_word_index'] as String?;

      if (savedFirstWords == null) return;

      if (savedChapterIndex != null) {
        // Load chapters up to saved position
        for (int i = 0; i <= savedChapterIndex; i++) {
          if (i > _lastLoadedChapterIndex) {
            final chapterPages = await _paginateChapter(
              widget.chapters[i].content ?? '',
              i,
            );
            setState(() {
              _pages.addAll(chapterPages);
              _lastLoadedChapterIndex = i;
            });
          }
        }

        // Find the best matching page using the same logic as handleUserChanges
        if (savedFirstWords != null && savedFirstWords.isNotEmpty) {
          int newPageIndex =
              _findMatchingPage(savedChapterIndex, savedFirstWords, '');
          setState(() {
            _currentPageIndex = newPageIndex.clamp(0, _pages.length - 1);
            _isLoadingInitial = false;
          });
        } else if (savedPageNumber != null && savedPageNumber < _pages.length) {
          setState(() {
            _currentPageIndex = savedPageNumber;
            _isLoadingInitial = false;
          });
        }

        // Update page controller position
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _pageController.jumpToPage(_currentPageIndex);
        });

        // Preload next chapter
        _loadNextChapter();
      }
    } catch (e) {
      print('Error restoring reading position: $e');
      setState(() => _isLoadingInitial = false);
    }
  }

  void _onPageChanged(int index) async {
    setState(() {
      _currentPageIndex = index;
      _currentChapter = _pages[index].chapterIndex;
    });

    print('current chapter: ::::: :: $_currentChapter');

    if (_isNextTap) {
      await _paywallBottomSheet();
    }

    if (index >= _pages.length - 5) {
      _loadNextChapter();
    }
    await _saveReadingPosition();
  }

  Future<void> handleUserChanges() async {
    if (_pages.isEmpty) return;

    final currentPage = _pages[_currentPageIndex];

    // Get the first and last few words of the current page for matching later
    final words = currentPage.content.split(' ');
    final firstWords = words.take(10).join(' '); // Take first 5 words
    final lastWords = words.length > 5
        ? words.skip(words.length - 5).join(' ')
        : ''; // Take last 5 words

    setState(() {
      _pages.clear();
      _isLoadingInitial = true;
      _lastLoadedChapterIndex = -1;
    });

    try {
      // Repaginate up to current chapter
      for (int i = 0; i <= currentPage.chapterIndex; i++) {
        final chapterContent = widget.chapters[i].content ?? '';
        final chapterPages = await _paginateChapter(chapterContent, i);
        setState(() {
          _pages.addAll(chapterPages);
          _lastLoadedChapterIndex = i;
        });
      }

      // Find the page that best matches our previous position
      int newPageIndex =
          _findMatchingPage(currentPage.chapterIndex, firstWords, lastWords);

      setState(() {
        _isLoadingInitial = false;
        _currentPageIndex = newPageIndex.clamp(0, _pages.length - 1);
      });

      // Update page view position
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.jumpToPage(_currentPageIndex);
      });

      // Load next chapter if needed
      _loadNextChapter();
    } catch (e) {
      print('Error handling user changes: $e');
    }
  }

  int _findMatchingPage(int chapterIndex, String firstWords, String lastWords) {
    // First try to find a page with matching first words
    int index = _pages.indexWhere((page) =>
        // page.chapterIndex == chapterIndex &&
        page.content.contains(firstWords));

    // If not found, try matching last words
    if (index == -1) {
      index = _pages.indexWhere((page) =>
          // page.chapterIndex == chapterIndex &&
          page.content.contains(lastWords));
    }

    // If still not found, just return the first page of the chapter
    if (index == -1) {
      index = _pages.indexWhere((page) =>
          page.chapterIndex == chapterIndex && !page.isChapterTitlePage);
    }

    return index != -1 ? index : 0;
  }

  void _handleNavigation(bool isForward) async {
    if (!FFAppState().readingMode) {
      FFAppState().readingMode = true;
      FFAppState().update(() {});
      return;
    }
    _isNextTap = isForward;
    if (isForward) {
      if (!_freeChaptersList.contains(_currentChapter)) {
        // if (_unlockedChapters < _currentChapter! ||
        //     (widget.chapters[_currentChapter - 1].paymentRequired ?? true)) {
        await _paywallBottomSheet();
      } else {
        await _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      }
    } else {
      await _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      // await widget.previousOnTap();
    }
    updateBookState();
  }

  Future<void> _showFontSettingsModal(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: FlutterFlowTheme.of(context).accent4,
      context: context,
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: ModalFontStyleUpdateWidget(
            defaultTextSize: FFAppState().defaultTextSize,
            userBookData: widget.userbookData,
            onApplyChanges: () async {
              handleUserChanges();
              return true;
            },
          ),
        ),
      ),
    );
  }

  double _calculateHybridProgress() {
    if (_pages.isNotEmpty && _currentPageIndex < _pages.length) {
      final currentPage = _pages[_currentPageIndex];

      final isLastLoadedChapter =
          currentPage.chapterIndex == _lastLoadedChapterIndex;
      final isLastBookChapter = currentPage.chapterIndex ==
          (widget.bookRef?.chapterCount?.toDouble() ?? 0) - 1;

      // Modified last page check
      final isLastPageInBook = isLastLoadedChapter &&
          isLastBookChapter &&
          currentPage.pageNumber ==
              _pages
                      .where((p) => p.chapterIndex == currentPage.chapterIndex)
                      .length -
                  1;

      if (isLastPageInBook) {
        return 100.0;
      }
    }

    // Regular progress calculation
    return _calculateRegularProgress();
  }

  double _calculateRegularProgress() {
    if (_pages.isEmpty || _currentPageIndex >= _pages.length) return 0.0;

    final currentPage = _pages[_currentPageIndex];
    double chapterProgress = currentPage.chapterIndex /
        (widget.bookRef?.chapterCount?.toDouble() ?? 0);
    double pageProgress = currentPage.pageNumber /
        _pages.where((p) => p.chapterIndex == currentPage.chapterIndex).length;

    setState(() {
      _bookProgress = ((chapterProgress +
                  (pageProgress /
                      (widget.bookRef?.chapterCount?.toDouble() ?? 0))) *
              100)
          .clamp(0.0, 99.9);
    });

    return _bookProgress;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              _buildPageView(),
              Column(
                children: [
                  _buildHeader(),
                  const Spacer(),
                  _buildFooter(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Visibility(
      visible: FFAppState().readingMode == false,
      child: Container(
        width: double.infinity,
        height: FFAppState().readingMode == false ? 110.0 : 0.0,
        padding: EdgeInsetsDirectional.fromSTEB(
            0.0, FFAppState().readingMode == false ? 55 : 65.0, 4.0, 0.0),
        decoration: BoxDecoration(
          color:
              FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () {
                if (widget.isFromSparkeBooks) {
                  context.pop();
                  context.pop();
                } else {
                  context.pop();
                }
              },
            ),
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.userbookData?.bookName,
                  '- - - - ',
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: FFAppState().selectedFontFamily,
                      fontSize:
                          //  FFAppState().defaultTextSize > 18
                          //     ? FFAppState().defaultTextSize - 5.5
                          //     :
                          FFAppState().defaultTextSize,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            _buildSettingsButtons(),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    final percentage = _calculateHybridProgress().toStringAsFixed(1);
    _updateBookProgress(_calculateHybridProgress());

    return Visibility(
      visible: FFAppState().readingMode == false,
      child: Container(
        width: double.infinity,
        height: FFAppState().readingMode == false ? 93.0 : 0.0,
        padding: EdgeInsets.only(
            left: 24,
            right: 24.0,
            bottom: 32,
            top: FFAppState().readingMode ? 0 : 10),
        decoration: BoxDecoration(
          color:
              FlutterFlowTheme.of(context).secondaryBackground.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Page ${_currentPageIndex + 1}',
              style: _getFontTextStyle(),
            ),
            Text(
              '$percentage%',
              style: _getFontTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsButtons() {
    return Row(
      children: [
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 8.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            FFIcons.kalignLeft,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 28.0,
          ),
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: ModalRemoveLibraryWidget(
                      userBookRef: widget.userbookRef,
                      userBookData: widget!.userbookData!,
                      comingFromBookReader: true,
                      onChapterSelect: onChapterSelected,
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
        ),
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            FFIcons.ktype02,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          onPressed: () => _showFontSettingsModal(context),
        ),
      ],
    );
  }

  // First, add the method to the _BookReaderState class

  Future<void> onChapterSelected(int chapterOrder) async {
    context.pop();
    // Find the chapter index based on chapter order
    final selectedChapterIndex = widget.chapters.indexWhere(
      (chapter) => chapter.chapterOrder == chapterOrder,
    );

    if (selectedChapterIndex == -1) return;

    // Load chapters up to selected chapter if not already loaded
    if (selectedChapterIndex > _lastLoadedChapterIndex) {
      setState(() => _isLoadingInitial = true);

      for (int i = _lastLoadedChapterIndex + 1;
          i <= selectedChapterIndex;
          i++) {
        final chapterPages = await _paginateChapter(
          widget.chapters[i].content ?? '',
          i,
        );
        setState(() {
          _pages.addAll(chapterPages);
          _lastLoadedChapterIndex = i;
        });
      }
    }

    // Find the first page of the selected chapter
    final targetPageIndex = _pages.indexWhere(
      (page) =>
          page.chapterIndex ==
              (widget.chapters[0].title == 'Prologue'
                  ? selectedChapterIndex
                  : (selectedChapterIndex + 1)) &&
          page.isChapterTitlePage,
    );

    if (targetPageIndex != -1) {
      setState(() {
        _currentPageIndex = targetPageIndex;
        _currentChapter = chapterOrder;
        _isLoadingInitial = false;
      });

      // Jump to the selected page
      _pageController.jumpToPage(targetPageIndex);

      // Save the new reading position
      await _saveReadingPosition();

      // Check if we need to load more chapters
      if (targetPageIndex >= _pages.length - 5) {
        _loadNextChapter();
      }

      // Update book progress
      updateBookState();
    }
  }

  Widget _buildPageView() {
    if (_isLoadingInitial) {
      return const LoadingPageWidget();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 30),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Container(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 5.0, 14.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: page.isChapterTitlePage
                          ? Center(
                              child: Text(
                                page.content,
                                style: _getFontTextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Text(
                              page.content,
                              style: _getFontTextStyle(),
                              textAlign: TextAlign.justify,
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
          _buildNavigationOverlays(),
        ],
      ),
    );
  }

  Widget _buildNavigationOverlays() {
    return Row(
      children: [
        _buildNavigationOverlay(
          onTap: () => _handleNavigation(false),
        ),
        _buildNavigationOverlay(
          onTap: () {
            setState(() {
              FFAppState().readingMode = !FFAppState().readingMode;
              // handleUserChanges();
            });
          },
        ),
        _buildNavigationOverlay(
          onTap: () => _handleNavigation(true),
        ),
      ],
    );
  }

  Widget _buildNavigationOverlay({required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          height: double.infinity,
        ),
      ),
    );
  }

  TextStyle _getFontTextStyle() {
    return FlutterFlowTheme.of(context).labelMedium.override(
          fontFamily: FFAppState().selectedFontFamily,
          fontSize: FFAppState().defaultTextSize,
          letterSpacing: 0.0,
        );
  }

  double _getBookContentHeight() {
    return FFAppState().selectedFontFamily == 'Open Sans'
        ? MediaQuery.of(context).size.height - 110
        : MediaQuery.of(context).size.height - 120;
  }

  void _updateBookProgress(double percentage) {
    FFAppState().update(() {
      FFAppState()
          .userBooksData
          .firstWhere((e) => e.userbookId == widget.userbookData.userbookId)
          .bookProgress = percentage;
    });
    // FFAppState().updateUserBooksDataAtIndex(
    //   FFAppState()
    //       .userBooksData
    //       .where((e) => valueOrDefault<bool>(
    //             e.userbookId == widget!.userbookData?.userbookId,
    //             false,
    //           ))
    //       .toList()
    //       .firstOrNull!
    //       .indexInLocal,
    //   (e) => e..bookProgress = percentage,
    // );
    // safeSetState(() {});
  }

  void updateBookState() {
    FFAppState().updateUserBooksDataAtIndex(
        FFAppState()
            .userBooksData
            .where((e) => valueOrDefault<bool>(
                  e.userbookId == widget!.userbookData?.userbookId,
                  false,
                ))
            .toList()
            .firstOrNull!
            .indexInLocal,
        (e) => e
          ..bookProgress = _bookProgress
          ..currentChapter = _currentChapter
        // ..isPaymentRequired = isPaymentRequired,
        );
    safeSetState(() {});
    unawaited(
      () async {
        await UserBooksTable().update(
          data: {
            'book_progress': _bookProgress,
            'chapter_index': _currentChapter,
          },
          matchingRows: (rows) => rows
              .eqOrNull(
                'id',
                widget!.userbookData?.userbookId,
              )
              .eqOrNull(
                'firebase_user_id',
                currentUserUid,
              ),
        );
      }(),
    );
  }

  Future<void> _paywallBottomSheet() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // update_user_book_details
    updateBookState();
    // if (_currentChapter > 1) {
    if (!_freeChaptersList.contains(_currentChapter)) {
      if (false && valueOrDefault<bool>(currentUserDocument?.anonymousUser, false)) {
        if (!_isBottomSheetOpen) {
          _isBottomSheetOpen = true;
          safeSetState(() {});
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: ModalUnlockUnauthUserWidget(
                    isFromSparkeBooks: widget.isFromSparkeBooks,
                  ),
                ),
              );
            },
          ).then((value) => setState(() {
                _isBottomSheetOpen = false;
              }));
        }
      } else {
        if (!_freeChaptersList.contains(_currentChapter)) {
          // if (_unlockedChapters < _currentChapter! ||
          //     (widget.chapters[_currentChapter].paymentRequired ?? true)) {
          if (!_isBottomSheetOpen) {
            setState(() {
              _isBottomSheetOpen = true;
            });
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: FlutterFlowTheme.of(context).accent4,
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: ModalUnlockChapterWidget(
                      remainingChapters:
                          widget.chapters.length - _unlockedChapters,
                      bookID: widget.bookRef,
                      userBook: widget.userbookRef,
                      callBack: (chapterNum) async {
                        final bool dailyPassUsedCopy =
                            await incrementChaptersUnlockedBy1(
                          currentUserUid,
                          widget!.userbookData!.bookId,
                        );
                        if (dailyPassUsedCopy!) {
                          // update_unlocked_chapters
                          _unlockedChapters = _unlockedChapters + chapterNum;
                          // Add the newly unlocked chapter to _freeChaptersList
                          // This handles a single chapter unlock
                          if (!_freeChaptersList.contains(_currentChapter)) {
                            _freeChaptersList.add(_currentChapter);
                            // Sort the list to ensure it's in ascending order
                            _freeChaptersList.sort();
                          }
                          safeSetState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have used your daily pass!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).success,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to use daily pass. Please try again later!',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Figtree',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          context.safePop();
                        }
                      },
                      pageView: () async {},
                      isRedeemedSuccessfully:
                          (isRedeemed, noOfChaptersRedeemed) async {
                        if (isRedeemed) {
                          _unlockedChapters =
                              _unlockedChapters + noOfChaptersRedeemed;
                          // Add all newly unlocked chapters to _freeChaptersList
                          // This handles bulk chapter unlocking
                          int startChapter = _currentChapter;
                          for (int i = 0; i < noOfChaptersRedeemed; i++) {
                            int chapterToAdd = startChapter + i;
                            if (!_freeChaptersList.contains(chapterToAdd)) {
                              _freeChaptersList.add(chapterToAdd);
                            }
                          }

                          // Sort the list to ensure it's in ascending order
                          _freeChaptersList.sort();
                          safeSetState(() {});
                        }
                      },
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {
                  _isBottomSheetOpen = false;
                }));
          }
        }
      }
    }
    FFAppState().update(() {});
    safeSetState(() {});
  }
}
