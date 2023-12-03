import psycopg2

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

print("-------------------------------------------------------------------------")

# запит для стовпчикової діаграми: візуалізація всього доходу для кожного фільму
bar_chart_query = """
    SELECT movie_id, title, total_gross
    FROM movie
    JOIN financials ON movie.financials_id = financials.financials_id;
"""

bar_chart_data = execute_query(bar_chart_query)

# виведення результату запиту А
print("Bar Chart Query Results:")
for row in bar_chart_data:
    print(row)
print("-------------------------------------------------------------------------")

# запит для кругової діаграми: візуалізація розподілу фільмів по жанрах
pie_chart_query = """
    SELECT genre, COUNT(*) as count
    FROM movie
    GROUP BY genre;
"""

pie_chart_data = execute_query(pie_chart_query)

# виведення результату запиту Б
print("\nPie Chart Query Results:")
for row in pie_chart_data:
    print(row)

print("-------------------------------------------------------------------------")
# запит для графіку залежності: візуалізація залежності фільмів від їх рейтингу
dependencies_query = """
    SELECT movie.title, rating.mpaa_rating
    FROM movie
    JOIN rating ON movie.rating_id = rating.rating_id;
"""

dependencies_data = execute_query(dependencies_query)

# виведення результату запиту С
print("\nDependencies Graph Query Results:")
for row in dependencies_data:
    print(row)
print("-------------------------------------------------------------------------")