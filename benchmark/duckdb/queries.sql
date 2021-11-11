SELECT count(*) FROM hits;
SELECT count(*) FROM hits WHERE AdvEngineID != 0;
SELECT sum(AdvEngineID), count(*), avg(ResolutionWidth) FROM hits;
SELECT sum(UserID) FROM hits;
SELECT COUNT(DISTINCT UserID) FROM hits;
SELECT COUNT(DISTINCT SearchPhrase) FROM hits;
SELECT min(EventDate), max(EventDate) FROM hits;
SELECT AdvEngineID, count(*) FROM hits WHERE AdvEngineID != 0 GROUP BY AdvEngineID ORDER BY count(*) DESC;
SELECT RegionID, COUNT(DISTINCT UserID) AS u FROM hits GROUP BY RegionID ORDER BY u DESC LIMIT 10;
SELECT RegionID, sum(AdvEngineID), count(*) AS c, avg(ResolutionWidth), COUNT(DISTINCT UserID) FROM hits GROUP BY RegionID ORDER BY c DESC LIMIT 10;
SELECT MobilePhoneModel, COUNT(DISTINCT UserID) AS u FROM hits WHERE octet_length(MobilePhoneModel) > 0 GROUP BY MobilePhoneModel ORDER BY u DESC LIMIT 10;
SELECT MobilePhone, MobilePhoneModel, COUNT(DISTINCT UserID) AS u FROM hits WHERE octet_length(MobilePhoneModel) > 0 GROUP BY MobilePhone, MobilePhoneModel ORDER BY u DESC LIMIT 10;
SELECT SearchPhrase, count(*) AS c FROM hits WHERE octet_length(SearchPhrase) > 0 GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10;
SELECT SearchPhrase, COUNT(DISTINCT UserID) AS u FROM hits WHERE octet_length(SearchPhrase) > 0 GROUP BY SearchPhrase ORDER BY u DESC LIMIT 10;
SELECT SearchEngineID, SearchPhrase, count(*) AS c FROM hits WHERE octet_length(SearchPhrase) > 0 GROUP BY SearchEngineID, SearchPhrase ORDER BY c DESC LIMIT 10;
SELECT UserID, count(*) FROM hits GROUP BY UserID ORDER BY count(*) DESC LIMIT 10;
SELECT UserID, SearchPhrase, count(*) FROM hits GROUP BY UserID, SearchPhrase ORDER BY count(*) DESC LIMIT 10;
SELECT UserID, SearchPhrase, count(*) FROM hits GROUP BY UserID, SearchPhrase LIMIT 10;
SELECT UserID, extract(minute FROM (TIMESTAMP '1970-01-01 00:00:00' + to_seconds(EventTime))) AS m, SearchPhrase, count(*) FROM hits GROUP BY UserID, m, SearchPhrase ORDER BY count(*) DESC LIMIT 10;
SELECT UserID FROM hits WHERE UserID = 12345678901234567890;
SELECT count(*) FROM hits WHERE URL::TEXT LIKE '%metrika%';
SELECT SearchPhrase, min(URL), count(*) AS c FROM hits WHERE URL::TEXT LIKE '%metrika%' AND octet_length(SearchPhrase) > 0 GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10;
SELECT SearchPhrase, min(URL), min(Title), count(*) AS c, COUNT(DISTINCT UserID) FROM hits WHERE Title::TEXT LIKE '%Яндекс%' AND URL::TEXT NOT LIKE '%.yandex.%' AND octet_length(SearchPhrase) > 0 GROUP BY SearchPhrase ORDER BY c DESC LIMIT 10;
SELECT * FROM hits WHERE URL::TEXT LIKE '%metrika%' ORDER BY EventTime LIMIT 10;
SELECT SearchPhrase FROM hits WHERE octet_length(SearchPhrase) > 0 ORDER BY EventTime LIMIT 10;
SELECT SearchPhrase FROM hits WHERE octet_length(SearchPhrase) > 0 ORDER BY SearchPhrase LIMIT 10;
SELECT SearchPhrase FROM hits WHERE octet_length(SearchPhrase) > 0 ORDER BY EventTime, SearchPhrase LIMIT 10;
SELECT CounterID, avg(octet_length(URL)) AS l, count(*) AS c FROM hits WHERE octet_length(URL) > 0 GROUP BY CounterID HAVING count(*) > 100000 ORDER BY l DESC LIMIT 25;
SELECT regexp_replace(Referer::TEXT, '^https?://(?:www\.)?([^/]+)/.*$', '\1') AS key, avg(octet_length(Referer)) AS l, count(*) AS c, min(Referer) FROM hits WHERE octet_length(Referer) > 0 GROUP BY key HAVING count(*) > 100000 ORDER BY l DESC LIMIT 25;
SELECT sum(ResolutionWidth), sum(ResolutionWidth + 1), sum(ResolutionWidth + 2), sum(ResolutionWidth + 3), sum(ResolutionWidth + 4), sum(ResolutionWidth + 5), sum(ResolutionWidth + 6), sum(ResolutionWidth + 7), sum(ResolutionWidth + 8), sum(ResolutionWidth + 9), sum(ResolutionWidth + 10), sum(ResolutionWidth + 11), sum(ResolutionWidth + 12), sum(ResolutionWidth + 13), sum(ResolutionWidth + 14), sum(ResolutionWidth + 15), sum(ResolutionWidth + 16), sum(ResolutionWidth + 17), sum(ResolutionWidth + 18), sum(ResolutionWidth + 19), sum(ResolutionWidth + 20), sum(ResolutionWidth + 21), sum(ResolutionWidth + 22), sum(ResolutionWidth + 23), sum(ResolutionWidth + 24), sum(ResolutionWidth + 25), sum(ResolutionWidth + 26), sum(ResolutionWidth + 27), sum(ResolutionWidth + 28), sum(ResolutionWidth + 29), sum(ResolutionWidth + 30), sum(ResolutionWidth + 31), sum(ResolutionWidth + 32), sum(ResolutionWidth + 33), sum(ResolutionWidth + 34), sum(ResolutionWidth + 35), sum(ResolutionWidth + 36), sum(ResolutionWidth + 37), sum(ResolutionWidth + 38), sum(ResolutionWidth + 39), sum(ResolutionWidth + 40), sum(ResolutionWidth + 41), sum(ResolutionWidth + 42), sum(ResolutionWidth + 43), sum(ResolutionWidth + 44), sum(ResolutionWidth + 45), sum(ResolutionWidth + 46), sum(ResolutionWidth + 47), sum(ResolutionWidth + 48), sum(ResolutionWidth + 49), sum(ResolutionWidth + 50), sum(ResolutionWidth + 51), sum(ResolutionWidth + 52), sum(ResolutionWidth + 53), sum(ResolutionWidth + 54), sum(ResolutionWidth + 55), sum(ResolutionWidth + 56), sum(ResolutionWidth + 57), sum(ResolutionWidth + 58), sum(ResolutionWidth + 59), sum(ResolutionWidth + 60), sum(ResolutionWidth + 61), sum(ResolutionWidth + 62), sum(ResolutionWidth + 63), sum(ResolutionWidth + 64), sum(ResolutionWidth + 65), sum(ResolutionWidth + 66), sum(ResolutionWidth + 67), sum(ResolutionWidth + 68), sum(ResolutionWidth + 69), sum(ResolutionWidth + 70), sum(ResolutionWidth + 71), sum(ResolutionWidth + 72), sum(ResolutionWidth + 73), sum(ResolutionWidth + 74), sum(ResolutionWidth + 75), sum(ResolutionWidth + 76), sum(ResolutionWidth + 77), sum(ResolutionWidth + 78), sum(ResolutionWidth + 79), sum(ResolutionWidth + 80), sum(ResolutionWidth + 81), sum(ResolutionWidth + 82), sum(ResolutionWidth + 83), sum(ResolutionWidth + 84), sum(ResolutionWidth + 85), sum(ResolutionWidth + 86), sum(ResolutionWidth + 87), sum(ResolutionWidth + 88), sum(ResolutionWidth + 89) FROM hits;
SELECT SearchEngineID, ClientIP, count(*) AS c, sum("refresh"), avg(ResolutionWidth) FROM hits WHERE octet_length(SearchPhrase) > 0 GROUP BY SearchEngineID, ClientIP ORDER BY c DESC LIMIT 10;
SELECT WatchID, ClientIP, count(*) AS c, sum("refresh"), avg(ResolutionWidth) FROM hits WHERE octet_length(SearchPhrase) > 0 GROUP BY WatchID, ClientIP ORDER BY c DESC LIMIT 10;
SELECT WatchID, ClientIP, count(*) AS c, sum("refresh"), avg(ResolutionWidth) FROM hits GROUP BY WatchID, ClientIP ORDER BY c DESC LIMIT 10;
SELECT URL, count(*) AS c FROM hits GROUP BY URL ORDER BY c DESC LIMIT 10;
SELECT 1, URL, count(*) AS c FROM hits GROUP BY 1, URL ORDER BY c DESC LIMIT 10;
SELECT ClientIP, ClientIP - 1, ClientIP - 2, ClientIP - 3, count(*) AS c FROM hits GROUP BY ClientIP, ClientIP - 1, ClientIP - 2, ClientIP - 3 ORDER BY c DESC LIMIT 10;
SELECT URL, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND DontCountHits = 0 AND "refresh" = 0 AND octet_length(URL) > 0 GROUP BY URL ORDER BY PageViews DESC LIMIT 10;
SELECT Title, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND DontCountHits = 0 AND "refresh" = 0 AND octet_length(Title) > 0 GROUP BY Title ORDER BY PageViews DESC LIMIT 10;
SELECT URL, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND "refresh" = 0 AND IsLink != 0 AND IsDownload = 0 GROUP BY URL ORDER BY PageViews DESC LIMIT 1000;
SELECT TraficSourceID, SearchEngineID, AdvEngineID, CASE WHEN (SearchEngineID = 0 AND AdvEngineID = 0) THEN Referer ELSE '' END AS Src, URL AS Dst, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND "refresh" = 0 GROUP BY TraficSourceID, SearchEngineID, AdvEngineID, Src, Dst ORDER BY PageViews DESC LIMIT 1000;
SELECT URLHash, EventDate, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND "refresh" = 0 AND TraficSourceID IN (-1, 6) AND RefererHash = 686716256552154761 GROUP BY URLHash, EventDate ORDER BY PageViews DESC LIMIT 100;
SELECT WindowClientWidth, WindowClientHeight, count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-31' AND "refresh" = 0 AND DontCountHits = 0 AND URLHash = 686716256552154761 GROUP BY WindowClientWidth, WindowClientHeight ORDER BY PageViews DESC LIMIT 10000;
SELECT DATE_TRUNC('minute', (TIMESTAMP '1970-01-01 00:00:00' + to_seconds(EventTime))) AS "Minute", count(*) AS PageViews FROM hits WHERE CounterID = 62 AND (DATE '1970-01-01' + EventDate) >= '2013-07-01' AND (DATE '1970-01-01' + EventDate) <= '2013-07-02' AND "refresh" = 0 AND DontCountHits = 0 GROUP BY DATE_TRUNC('minute', (TIMESTAMP '1970-01-01 00:00:00' + to_seconds(EventTime))) ORDER BY DATE_TRUNC('minute', (TIMESTAMP '1970-01-01 00:00:00' + to_seconds(EventTime)));
