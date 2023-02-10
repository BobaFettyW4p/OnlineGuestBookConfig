import sqlite3

conn = sqlite3.connect('/usr/local/FlaskApp/database.db')

cursor = conn.cursor()

cursor.execute('''CREATE TABLE visitors (
    name TEXT,
    message TEXT
);
'''
)

conn.commit()
cursor.execute('INSERT INTO visitors VALUES ("Matthew Ivancic","first")')
conn.commit()