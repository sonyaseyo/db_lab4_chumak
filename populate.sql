-- Insert data into financials table
INSERT INTO financials (financials_id, total_gross, inflation_adjusted_gross)
VALUES
  (1, 184925485, 5228953251),
  (2, 84300000, 2188229052),
  (3, 83320000, 2187090808),
  (4, 65000000, 1078510579),
  (5, 85000000, 920608730),
  (6, 54228104, 78682079),
  (7, 74541707, 101161045),
  (8, 8968684, 11740942),
  (9, 24732041, 30737517),
  (10, 293004164, 329336681),
  (11, 334191110, 357063499),
  (12, 26692846, 28375869),
  (13, 400738009, 414997174),
  (14, 341268248, 341268248),
  (15, 529483936, 529483936);

-- Insert data into rating table
INSERT INTO rating (mpaa_rating, rating_id)
VALUES
  ('PG-13', 1),
  ('G', 2),
  ('PG', 3);

-- Insert data into movie table
INSERT INTO movie (movie_id, title, release_date, genre, financials_id, rating_id)
VALUES
  (101, 'Snow White and the Seven Dwarfs', '1937-12-21', 'Musical', 1, 2),
  (102, 'Pinocchio', '1940-02-09', 'Adventure', 2, 2),
  (103, 'Fantasia', '1940-11-13', 'Musical', 3, 2),
  (104, 'Song of the South', '1946-11-12', 'Adventure', 4, 2),
  (105, 'Cinderella', '1950-02-15', 'Drama', 5, 2),
  (106, 'The Count of Monte Cristo', '2002-01-25', 'Drama', 6, 1),
  (107, 'Ladder 49', '2004-10-01', 'Action', 7, 1),
  (108, 'Aliens of the Deep', '2005-01-28', 'Documentary', 8, 2),
  (109, 'Tim Burton''s The Nightmare Before Christmas', '2006-10-20', 'Musical', 9, 3),
  (110, 'Up', '2009-05-29', 'Adventure', 10, 3),
  (111, 'Alice in Wonderland', '2010-03-05', 'Adventure', 11, 3),
  (112, 'Winnie the Pooh', '2011-07-15', 'Adventure', 12, 2),
  (113, 'Frozen', '2013-11-22', 'Adventure', 13, 3),
  (114, 'Zootopia', '2016-03-04', 'Adventure', 14, 3),
  (115, 'Rogue One: A Star Wars Story', '2016-12-16', 'Adventure', 15, 1);
