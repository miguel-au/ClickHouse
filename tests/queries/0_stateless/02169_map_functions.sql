DROP TABLE IF EXISTS table_map;
create TABLE table_map (id UInt32, col Map(String, UInt64)) engine = MergeTree() ORDER BY tuple();
INSERT INTO table_map SELECT number, map('key1', number, 'key2', number * 2) FROM numbers(1111, 3);
INSERT INTO table_map SELECT number, map('key3', number, 'key2', number + 1, 'key4', number + 2) FROM numbers(100, 4);

SELECT mapFilter((k,v)->k like '%3' and v > 102, col) FROM table_map ORDER BY id;
SELECT col, mapFilter((k, v) -> ((v % 10) > 1), col) FROM table_map ORDER BY id ASC;
SELECT mapApply((k,v)->(k,v+1), col)  FROM table_map ORDER BY id;
SELECT mapApply((x, y) -> (x, x + 1), map(1, 0, 2, 0));
SELECT mapFilter((k,v)->0, col) from table_map;
SELECT mapUpdate(map(1, 3, 3, 2), map(1, 0, 2, 0));
DROP TABLE table_map;
