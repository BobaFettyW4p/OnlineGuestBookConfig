import sqlite3

conn = sqlite3.connect('database.db')

cursor = conn.cursor()

cursor.execute('''CREATE TABLE visits (
    website TEXT,
    total_visitors INTEGER
);
'''
)

cursor.execute('''CREATE TABLE visitors (
    name TEXT,
    message TEXT
);
'''
)

conn.commit()
cursor.execute('INSERT INTO visits VALUES ("test.mivancic.com",0)')
cursor.execute('INSER INTO visitors VALUES ("Matthew Ivancic","first")')
conn.commit()