# OnlineGuestBook

This repo is used in conjunction with its `sister repo <https://github.com/BobaFettyW4p/OnlineGuestbookTerraform>`_ to create an online guestbook hosted via an EC2 instance

Components
----------


A `python script <https://github.com/BobaFettyW4p/OnlineGuestBook/blob/main/create_sqlite_table.py>`_ that initializes the SQLite database in the EC2 instance, and creates a table that will be used to store values from the web app with an initial value

A `flask app <https://github.com/BobaFettyW4p/OnlineGuestBook/tree/main/FlaskApp>`_ that both serves as the front end of the web page, as well as the scripting compoennt of the back end

A `WSGI configuration file <https://github.com/BobaFettyW4p/OnlineGuestBook/blob/main/FlaskApp/app.wsgi>`_ that allows the server to utilize a production-grade WSGI server to host the flask app

An `Apache configuration file <https://github.com/BobaFettyW4p/OnlineGuestBook/blob/main/basic-flask-app.conf>`_ that ensures Apache/httpd is appropriately configured to display the WSGI server