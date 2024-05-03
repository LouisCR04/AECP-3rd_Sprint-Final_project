#!/usr/bin/python3
# app.py

""" Flask web Server """

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.infinance import Infinance
from models.outfinance import Outfinance
from models.deptfinance import Deptfinance
from models import storage
from flask import Flask, render_template, abort

app = Flask(__name__)

@app.teardown_appcontext
def close_db(error):
    """Remove current SQLAlchemy Session"""
    storage.close()


@app.route("/", strict_slashes=False)
def home():
    return render_template('index.html')


@app.route("/counties", strict_slashes=False)
def counties():
    """Displays a list of Counties"""
    counties = storage.all(County).values()
    counties = sorted(counties, key=lambda k: k.name)
    return render_template('counties.html', counties=counties)


@app.route("/subcounties", strict_slashes=False)
def sub_counties():
    """Displays a list of subcounties in Counties"""
    counties = storage.all(County).values()
    counties = sorted(counties, key=lambda k: k.name)
    st_ct = []

    for county in counties:
        st_ct.append([county, sorted(county.subcounties, key=lambda k: k.name)])

    return render_template('sub_counties.html',
                           counties=st_ct,
                           h_1="Counties")


@app.route("/<subcounty>", strict_slashes=False)
def churches(subcounty):
    """Displays a list of churches in the selected subcounty"""
    valid_subc = [sub.name for sub in storage.all(Subcounty).values()]

    if subcounty not in valid_subc:
        abort(404)

    subcounties = storage.get(Subcounty, subcounty)
    subcounties = sorted(subcounties, key=lambda k: k.name)
    ch_list = sorted(subcounty.churches, key=lambda k: k.name)

    return render_template('churches.html', church=ch_list)


if __name__ == "__main__":
    """Run if main"""
    app.run(host='0.0.0.0', port=5000)
