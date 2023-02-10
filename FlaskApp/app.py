from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def index():
    conn = sqlite3.connect('/var/www/html/FlaskApp/database.db')
    cursor = conn.cursor()
    if request.method == 'POST':
        name = request.form['name']
        message = request.form['message']
        query = f'INSERT INTO visitors VALUES ("{name}","{message}")'
        
        try:
            cursor.execute(query)
            conn.commit()
        except:
            pass
    query = 'SELECT * FROM visitors;'
    cursor.execute(query)
    entries = cursor.fetchall()
    guestbook = [f'"{x[1]}" - {x[0]}' for x in entries]
    return render_template('index.html', guestbook = guestbook)

if __name__ == '__main__':
    app.run(debug=True)