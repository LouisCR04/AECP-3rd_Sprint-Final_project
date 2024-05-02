#!/usr/bin/python3
# app.py

""" Flask Web server """

from models import storage
from flask import Flask, render_template

app = Flask(__name__)


@app.teardown_appcontext
def close_db(error):
    """Remove current SQLAlchemy Session"""
    storage.close()

@app.route('/', strict_slashes=False)
def home():
    """This is the home page route"""
    return print("Home")

def Counties_list():
    """Displays a list of churches"""

if __name__ == "__main__":
    """Run if main"""
    app.run(host='0.0.0.0', port=5000)
