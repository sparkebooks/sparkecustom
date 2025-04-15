// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'dart:async';

Future<dynamic> bulkChapterCalculation(
  String userBookId,
  String chapterId,
) async {
  // Create Supabase Client
  final supabase = Supabase.instance.client;

  try {
    // First query: Get book details from user_books
    final userBookQuery = await supabase
        .from('user_books')
        .select('book_id')
        .eq('id', userBookId)
        .single();

    if (userBookQuery == null) {
      return {
        'success': false,
        'message': 'User book not found',
      };
    }

    final String bookId = userBookQuery['book_id'];

    // Second query: Get book pricing details
    final bookQuery = await supabase
        .from('books')
        .select('cost_per_chapter, bulk_chapter_number')
        .eq('id', bookId)
        .single();

    if (bookQuery == null) {
      return {
        'success': false,
        'message': 'Book not found',
      };
    }

    final double costPerChapter = bookQuery['cost_per_chapter'];
    final int bulkChapterNumber = bookQuery['bulk_chapter_number'];

    // Third query: Get current chapter order
    final chapterQuery = await supabase
        .from('chapters')
        .select('chapter_order')
        .eq('id', chapterId)
        .eq('book_id', bookId)
        .single();

    if (chapterQuery == null) {
      return {
        'success': false,
        'message': 'Chapter not found',
      };
    }

    final int currentChapterOrder = chapterQuery['chapter_order'];

    // Fourth query: Count remaining chapters
    final remainingChaptersQuery = await supabase
        .from('chapters')
        .select('*')
        .eq('book_id', bookId)
        .gte('chapter_order', currentChapterOrder);

    final int remainingChapters = remainingChaptersQuery.length;

    // Calculate bulk cost
    final double bulkCost = costPerChapter * bulkChapterNumber;

    // Check if enough chapters remain
    final bool isValidPurchase = remainingChapters >= bulkChapterNumber;

    // Return response
    return {
      'success': true,
      'is_valid_purchase': isValidPurchase,
      'bulk_chapter_number': bulkChapterNumber,
      'cost_per_chapter': costPerChapter,
      'bulk_cost': bulkCost,
      'remaining_chapters': remainingChapters,
    };
  } catch (e) {
    return {
      'success': false,
      'message': 'Error: ${e.toString()}',
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
