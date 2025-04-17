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

class PaginatedTropeList extends StatefulWidget {
  const PaginatedTropeList({
    super.key,
    this.width,
    this.height,
    required this.bookItemBuilder,
    required this.emptyListWidget,
    required this.loadingWidget,
    required this.errorWidget,
    required this.selectedTrope,
    required this.pageSize,
    required this.sortBy,
  });

  final double? width;
  final double? height;
  final Widget Function(BooksRow book, int index) bookItemBuilder;
  final Widget Function() emptyListWidget;
  final Widget Function() loadingWidget;
  final Widget Function() errorWidget;
  final String selectedTrope;
  final String sortBy;
  final int pageSize;

  @override
  State<PaginatedTropeList> createState() => _PaginatedTropeListState();
}

class _PaginatedTropeListState extends State<PaginatedTropeList> {
  // Pagination state
  int _currentPage = 1;
  bool _hasMoreData = true;
  List<BooksRow> _books = [];
  bool _isLoading = false;
  bool _isInitialLoading = true;
  String? _error;
  int booksTotalCount = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _loadInitialData();
  }

  @override
  void didUpdateWidget(PaginatedTropeList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the trope selection changes, reset and reload data
    if (oldWidget.sortBy != widget.sortBy) {
      print('did update widget called');
      _resetAndReload();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoading &&
        // _hasMoreData ) {
        _books.length < booksTotalCount) {
      print('_scrollListener: Loading more data');
      _loadMoreData();
    }
  }

  void _resetAndReload() {
    setState(() {
      _currentPage = 1;
      _hasMoreData = true;
      _books = [];
      _isInitialLoading = true;
      _error = null;
    });
    print('_resetAndReload called');
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    print('loading initial data');
    booksTotalCount = await getRowCount('books');
    await _fetchBooks(_currentPage);
  }

  Future<void> _loadMoreData() async {
    if (_isLoading || !_hasMoreData) return;
    print('loading more data');
    await _fetchBooks(_currentPage);
  }

  Future<void> _fetchBooks(int page) async {
    if (_isLoading || !_hasMoreData) return;

    String sortBooksBy = 'last_updated_at';

    if (widget.sortBy == 'Top') {
      sortBooksBy = 'book_score';
    } else if (widget.sortBy == 'A-Z') {
      sortBooksBy = 'title';
    } else {
      sortBooksBy;
    }

    print('fetching books: \n page: $page');

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Calculate offset based on current page and page size
      final offset = (page - 1) * widget.pageSize;

      print('offset: $offset');

      // Fetch books from the database
      final newBooks = await BooksTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'primary_trope',
              widget.selectedTrope,
            )
            .eqOrNull(
              'Status',
              BookStatus.Published.name,
            )
            .range(offset, offset + widget.pageSize - 1)
            .order(sortBooksBy, ascending: true),
      );

      print('newBooks Length: ${newBooks.length}');

      setState(() {
        if (page == 1) {
          // Replace existing books for page 1
          _books = newBooks;
        } else {
          // Append new books for subsequent pages
          for (int i = 0; i < newBooks.length; i++) {
            if (_books.any((e) => e.id == newBooks[i].id)) {
              continue;
            } else {
              _books.add(newBooks[i]);
            }
          }
        }

        print('total books: ${_books.length}');

        // Update pagination state
        _currentPage++;
        _hasMoreData = newBooks.length >= widget.pageSize;
        _isLoading = false;
        _isInitialLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isInitialLoading = false;
        _error = e.toString();
      });
      print('Error fetching books: $e');
    }
  }

  Future<int> getRowCount(String tableName) async {
    try {
      // Execute a count query
      final response = await Supabase.instance.client
          .from(tableName)
          .select('*')
          .eq('primary_trope', widget.selectedTrope)
          .eq('Status', BookStatus.Published.name);

      // Extract the count from the response
      final count = response.length;

      return count ?? 0; // Return count, or 0 if null
    } catch (e) {
      print('Error fetching row count: $e');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Handle loading state
    if (_isInitialLoading) {
      print('loading widget');
      return widget.loadingWidget();
    }

    // Handle error state
    if (_error != null) {
      print('error widget');
      return widget.errorWidget();
    }

    // Handle empty state
    if (_books.isEmpty) {
      print('empty widget');
      return widget.emptyListWidget();
    }

    // Display books list with pagination
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trope Results',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    booksTotalCount.toString(),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          // Build book items
          ..._books
              .map((book) => widget.bookItemBuilder(book, _books.indexOf(book)))
              .toList(),

          // Show loading indicator at the bottom when more data is available
          if (_hasMoreData)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
