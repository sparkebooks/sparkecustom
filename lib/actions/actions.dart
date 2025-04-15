import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import '/main_screens/books/book_components/modal_book_details/modal_book_details_widget.dart';

Future createUserBook(
  BuildContext context, {
  BooksRow? bookID,
  required bool? isModal,
  UserBooksDataStruct? userbookData,
  required bool? isFromSparkeBooks,
  int? chapterToNavigate,
}) async {
  List<UserBooksRow>? bookExists;
  List<ChaptersRow>? chapter;
  List<UserBooksRow>? updatedBook;
  List<UserBooksRow>? updatedBookLastWord;
  UserBooksRow? newUserBook;
  ClickThroughsRow? newClickThrough;

  HapticFeedback.mediumImpact();
  // get_user_book
  bookExists = await UserBooksTable().queryRows(
    queryFn: (q) => q
        .eqOrNull(
          'book_id',
          bookID?.id,
        )
        .eqOrNull(
          'firebase_user_id',
          currentUserReference?.id,
        ),
  );
  // get_Chapters
  chapter = await ChaptersTable().queryRows(
    queryFn: (q) => q
        .eqOrNull(
          'book_id',
          bookID?.id,
        )
        .order('chapter_order', ascending: true),
  );
  if (bookExists.length >= 1) {
    if (!(FFAppState()
        .userBooksData
        .where((e) => e.bookId == bookID?.id)
        .toList()
        .isNotEmpty)) {
      FFAppState().addToUserBooksData(UserBooksDataStruct(
        userbookId: bookExists.firstOrNull?.id,
        userbookPageNumber: bookExists.firstOrNull?.pageNumber,
        chaptersUnlocked: bookExists.firstOrNull?.chaptersUnlocked,
        bookTotalPages: bookExists.firstOrNull?.totalPages,
        readingMode: false,
        indexInLocal: FFAppState().userBooksData.length,
        bookId: bookExists.firstOrNull?.bookId,
        updatedAt: getCurrentTimestamp,
        bookName: bookID?.title,
        bookProgress: 0.0,
        currentChapter: chapterToNavigate != null
            ? chapterToNavigate
            : chapter.firstOrNull?.chapterOrder,
        bookImage: valueOrDefault<String>(
          bookID?.coverImage,
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/0c2kl70qgj7o/book_cover%402x.jpg',
        ),
      ));
      FFAppState().update(() {});
    }
    // update_user_book
    updatedBook = await UserBooksTable().update(
      data: {
        'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
      },
      matchingRows: (rows) => rows.eqOrNull(
        'id',
        bookExists?.firstOrNull?.id,
      ),
      returnRows: true,
    );
    if (isFromSparkeBooks!) {
      // update_user_book
      updatedBookLastWord = await UserBooksTable().update(
        data: {
          'chapter_index': chapterToNavigate,
          'last_visited_word_index': 'Chapter ${chapterToNavigate?.toString()}',
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          bookExists?.firstOrNull?.id,
        ),
        returnRows: true,
      );
    }

    context.pushNamed(
      BookDetailsWithoutScrollWidget.routeName,
      queryParameters: {
        'userbookData': serializeParam(
          FFAppState()
              .userBooksData
              .where((e) => e.userbookId == updatedBook?.firstOrNull?.id)
              .toList()
              .firstOrNull,
          ParamType.DataStruct,
        ),
        'isFromSparkeBooks': serializeParam(
          isFromSparkeBooks,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  } else {
    if (isModal == true) {
      // create_user_book
      newUserBook = await UserBooksTable().insert({
        'book_id': bookID?.id,
        'status': '0',
        'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
        'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
        'firebase_user_id': currentUserReference?.id,
        'page_number': 1,
        'opened': true,
        'total_pages': valueOrDefault<int>(
          bookID?.totalPages,
          0,
        ),
        'chapter_id': chapter.firstOrNull?.id,
        'chapter_id_index': chapterToNavigate != null
            ? chapterToNavigate
            : chapter.firstOrNull?.chapterOrder,
        'chapter_index': chapterToNavigate != null
            ? chapterToNavigate
            : chapter.firstOrNull?.chapterOrder,
        'chapters_unlocked': chapterToNavigate != null
            ? chapterToNavigate
            : valueOrDefault<int>(
                functions.calculateFreeChaptersCount(chapter.toList()),
                1,
              ),
        'book_progress': 0.0,
      });
      if (isFromSparkeBooks != null) {
        if (isFromSparkeBooks) {
          await UserBooksTable().update(
            data: {
              'last_visited_word_index':
                  'Chapter ${chapterToNavigate?.toString()}',
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              newUserBook?.id,
            ),
          );
        }
      }
      FFAppState().addToUserBooksData(UserBooksDataStruct(
        userbookId: newUserBook.id,
        userbookPageNumber: newUserBook.pageNumber,
        chaptersUnlocked: newUserBook.chaptersUnlocked,
        bookTotalPages: newUserBook.totalPages,
        readingMode: true,
        indexInLocal: FFAppState().userBooksData.length,
        bookId: newUserBook.bookId,
        updatedAt: getCurrentTimestamp,
        bookName: bookID?.title,
        currentChapter: chapterToNavigate != null
            ? chapterToNavigate
            : chapter.firstOrNull?.chapterOrder,
        bookProgress: 0.0,
        bookImage: valueOrDefault<String>(
          bookID?.coverImage,
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sparke-7lyyy6/assets/0c2kl70qgj7o/book_cover%402x.jpg',
        ),
      ));
      FFAppState().update(() {});
      // create_clickthorugh
      unawaited(
        () async {
          newClickThrough = await ClickThroughsTable().insert({
            'book_id': bookID?.id,
            'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
            'id': random_data
                .randomInteger(100000000000, 999999999999)
                .toString(),
          });
        }(),
      );
      // update_user_total_books
      unawaited(
        () async {
          await currentUserReference!.update({
            ...createUsersRecordData(
              lastActiveTime: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'total_books': FieldValue.increment(1),
              },
            ),
          });
        }(),
      );

      context.pushNamed(
        BookDetailsWithoutScrollWidget.routeName,
        queryParameters: {
          'userbookData': serializeParam(
            FFAppState()
                .userBooksData
                .where((e) => e.userbookId == newUserBook?.id)
                .toList()
                .firstOrNull,
            ParamType.DataStruct,
          ),
          'isFromSparkeBooks': serializeParam(
            isFromSparkeBooks,
            ParamType.bool,
          ),
        }.withoutNulls,
      );
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: FlutterFlowTheme.of(context).accent4,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: ModalBookDetailsWidget(
              bookRef: bookID,
            ),
          );
        },
      );
    }
  }

  // update_entire_app

  FFAppState().update(() {});
}

Future successSnackBar(
  BuildContext context, {
  required String? snackbarText,
}) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        snackbarText!,
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Figtree',
              letterSpacing: 0.0,
            ),
      ),
      duration: Duration(milliseconds: 3000),
      backgroundColor: FlutterFlowTheme.of(context).secondary,
    ),
  );
}

Future createUserAccount(BuildContext context) async {
  List<CoinsRow>? coinExists;

  await actions.closeKeyboard();
  // query_coins
  coinExists = await CoinsTable().queryRows(
    queryFn: (q) => q.eqOrNull(
      'firebase_user_id',
      currentUserReference?.id,
    ),
  );
  if ((coinExists).isNotEmpty) {
    context.goNamed(MainHomeWidget.routeName);
  } else {
    // create_coin_row
    await CoinsTable().insert({
      'firebase_user_id': currentUserReference?.id,
      'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
      'sparke_coins': 0,
      'balance': 0,
      'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
      'purchased_coins': 0,
    });
    // update_user_profile

    await currentUserReference!.update(createUsersRecordData(
      displayName:
          'Guest ${random_data.randomInteger(100000, 999999).toString()}',
      totalBooks: 0,
      haveRead: false,
      anonymousUser: false,
      lastActiveTime: getCurrentTimestamp,
      lastReadNotification: getCurrentTimestamp,
      dailyPassLastActive: functions.returnYesterdaysDate(getCurrentTimestamp),
    ));

    context.pushNamed(
      OnboardingUserWidget.routeName,
      queryParameters: {
        'createProfile': serializeParam(
          true,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  }
}

Future loginUser(BuildContext context) async {
  List<CoinsRow>? coinExists;

  // query_coins
  coinExists = await CoinsTable().queryRows(
    queryFn: (q) => q.eqOrNull(
      'firebase_user_id',
      currentUserReference?.id,
    ),
  );
  if (!((coinExists).isNotEmpty)) {
    // create_coin_row
    await CoinsTable().insert({
      'firebase_user_id': currentUserReference?.id,
      'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
      'sparke_coins': 0,
      'balance': 0,
      'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
      'purchased_coins': 0,
    });
  }

  context.pushNamed(MainHomeWidget.routeName);
}
