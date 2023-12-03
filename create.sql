CREATE TABLE financials
(
  financials_id INT NOT NULL,
  total_gross DECIMAL(18, 2) NOT NULL,
  inflation_adjusted_gross DECIMAL(18, 2) NOT NULL,
  PRIMARY KEY (financials_id)
);

CREATE TABLE rating
(
  mpaa_rating VARCHAR(10) NOT NULL,
  rating_id INT NOT NULL,
  PRIMARY KEY (rating_id)
);

CREATE TABLE movie
(
  movie_id INT NOT NULL,
  title VARCHAR(260) NOT NULL,
  release_date DATE NOT NULL,
  genre VARCHAR(50) NOT NULL,
  financials_id INT NOT NULL,
  rating_id INT NOT NULL,
  PRIMARY KEY (movie_id),
  FOREIGN KEY (financials_id) REFERENCES financials(financials_id),
  FOREIGN KEY (rating_id) REFERENCES rating(rating_id)
);
