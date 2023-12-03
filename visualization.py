import psycopg2
import matplotlib.pyplot as plt

# параметри для з'єднання з сервером
db_params = {
    'host': 'localhost',
    'database': 'db_lab3',
    'user': 'sonia',
    'password': '123'
}

# функція з sql запитами
def execute_query(query):
    conn = psycopg2.connect(**db_params)
    cursor = conn.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    conn.close()
    return result

# запит для стовпчикової діаграми: візуалізація всього доходу для кожного фільму
bar_chart_query = """
    SELECT movie_id, title, total_gross
    FROM movie
    JOIN financials ON movie.financials_id = financials.financials_id;
"""

bar_chart_data = execute_query(bar_chart_query)

# тут витягуємо дані для діаграми
titles = [row[1] for row in bar_chart_data]
total_gross = [row[2] for row in bar_chart_data]

# стовпчикова діаграма
plt.bar(titles, total_gross)
plt.xlabel('Movie Titles')
plt.ylabel('Total Gross')
plt.title('Total Gross for Each Movie')
plt.xticks(rotation=45, ha='right')
plt.show()

# запит для кругової діаграми: візуалізація розподілу фільмів по жанрах
pie_chart_query = """
    SELECT genre, COUNT(*) as count
    FROM movie
    GROUP BY genre;
"""

pie_chart_data = execute_query(pie_chart_query)

# витягуємо дані для діаграми
genres = [row[0] for row in pie_chart_data]
counts = [row[1] for row in pie_chart_data]

# кругова діаграма
plt.pie(counts, labels=genres, autopct='%1.1f%%', startangle=140)
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
plt.title('Distribution of Movies by Genre')
plt.show()

# запит для графіку залежності: візуалізація залежності фільмів від їх рейтингу
dependencies_query = """
    SELECT movie.title, rating.mpaa_rating
    FROM movie
    JOIN rating ON movie.rating_id = rating.rating_id;
"""

dependencies_data = execute_query(dependencies_query)

# витягуємо дані для графіку
movie_titles = [row[0] for row in dependencies_data]
mpaa_ratings = [row[1] for row in dependencies_data]

# графік залежності
plt.scatter(movie_titles, mpaa_ratings, label='Movies')
plt.plot(movie_titles, mpaa_ratings, linestyle='-', color='gray', alpha=0.5)  # Connect the dots with lines
plt.xlabel('Movie Titles')
plt.ylabel('MPAA Ratings')
plt.title('Dependencies Between Movies and MPAA Ratings')
plt.xticks(rotation=45, ha='right')
plt.legend()
plt.show()
