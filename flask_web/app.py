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
from flask_cors import CORS
#import uuid

app = Flask(__name__, static_url_path='/static', static_folder='static')
CORS(app)


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
    #cache_id = str(uuid.uuid4())
    return render_template('counties.html', counties=counties)
    #cache_id=cache_id


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


@app.route("/<sub_county>", strict_slashes=False)
def churches(sub_county):
    """Displays a list of churches in the selected subcounty"""

    sub = None

    # Get all Subcounty objects from storage
    all_subcounties = storage.all(Subcounty).values()

    # Find the Subcounty object with the matching name
    for sub_obj in all_subcounties:
        if sub_obj.name == sub_county:
            sub = sub_obj
            break

    if sub is None:
        abort(404)

    ch_list = sorted(sub.churches, key=lambda k: k.name)

    return render_template('churches.html', subcounty=sub, church=ch_list)


if __name__ == "__main__":
    """Run if main"""
    app.run(host='0.0.0.0', port=5000)
