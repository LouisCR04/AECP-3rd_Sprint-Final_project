#!/usr/bin/python3
# app.py

""" Flask Web server """
import models
from models.base_model import BaseModel, Base
from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.infinance import Infinance
from models.outfinance import Outfinance
from models.deptfinance import Deptfinance
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

@app.route('/counties', strict_slashes=False)
def counties_route():
    """Displays a list of counties"""

if __name__ == "__main__":
    """Run if main"""
    app.run(host='0.0.0.0', port=5000)
