# Sparke-Kaleo

## Update the books table in supabase through csv

1. Export it as csv through the dashboard, and do the update.
2. Make sure the temp.books_updated table exists and is empty, by executing the following sql in supabase dashboard's sql editor.
```sql
DROP TABLE IF EXISTS temp.books_updated;
CREATE TABLE temp.books_updated AS SELECT * FROM books WHERE FALSE;
```

3. Import your csv into this table using the dashboard.
4. Take a backup of the current books table
```sql
DROP TABLE IF EXISTS temp.books_backup;
CREATE TABLE temp.books_backup AS SELECT * FROM books;
```

5. Run the following to copy all edits into the real books table
```sql
INSERT INTO public.books
SELECT * FROM temp.books_updated
ON CONFLICT (id) DO UPDATE
SET
    title = EXCLUDED.title,
    author = EXCLUDED.author,
    blurb = EXCLUDED.blurb,
    primary_trope = EXCLUDED.primary_trope,
    secondary_trope = EXCLUDED.secondary_trope,
    description = EXCLUDED.description,
    just_out = EXCLUDED.just_out,
    "Status" = EXCLUDED."Status",
    valid = EXCLUDED.valid,
    rating = EXCLUDED.rating,
    file_url = EXCLUDED.file_url,
    cost_per_chapter = EXCLUDED.cost_per_chapter,
    bulk_chapter_number = EXCLUDED.bulk_chapter_number,
    series_name = EXCLUDED.series_name,
    series_order = EXCLUDED.series_order,
    discount_per_chapter = EXCLUDED.discount_per_chapter;
```

