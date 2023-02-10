import sqlite3

conn = sqlite3.connect('/var/www/html/FlaskApp/database.db')

cursor = conn.cursor()

cursor.execute('''CREATE TABLE visitors (
    name TEXT,
    message TEXT
);
'''
)

cursor.execute('CREATE UNIQUE INDEX visitor_name ON visitors (name);')

conn.commit()
cursor.execute('INSERT INTO visitors VALUES ("Matthew Ivancic","first")')
conn.commit()