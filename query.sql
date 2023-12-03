--Запит 1
--Вивести всі фільми жанру adventure випущені після 2010 року

--SELECT
--    m.movie_id,
--    m.title,
--    m.release_date,
--    m.genre,
--    f.total_gross,
--    f.inflation_adjusted_gross
--FROM
--    movie m
--    JOIN financials f ON m.financials_id = f.financials_id
--WHERE
--    m.genre = 'Adventure'
--    AND m.release_date > '2010-01-01';


--Запит 2
--Порахувати середній дохід для кожного рейтингу
--SELECT
--    r.mpaa_rating,
--    AVG(f.total_gross) AS average_total_gross
--FROM
--    movie m
--    JOIN financials f ON m.financials_id = f.financials_id
--   JOIN rating r ON m.rating_id = r.rating_id
--GROUP BY
--    r.mpaa_rating;


--Запит 3
--Вивести фільми із доходом більшим за n (напр. 200000000)
--SELECT
--  m.movie_id,
--  m.title,
--  m.release_date,
--  m.genre,
--  f.total_gross
--FROM
--  movie m
--JOIN
--  financials f ON m.financials_id = f.financials_id
--WHERE
--  f.total_gross > 200000000; 
