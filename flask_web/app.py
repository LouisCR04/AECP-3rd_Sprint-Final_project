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
import sys
#import uuid

app = Flask(__name__, static_url_path='/static')
CORS(app)


@app.teardown_appcontext
def close_db(error):
    """Remove current SQLAlchemy Session"""
    storage.close()


@app.route("/", strict_slashes=False)
def home():
    return render_template('index.html')


@app.route("/admin/counties", strict_slashes=False)
def counties():
    """Displays a list of Counties"""
    counties = storage.all(County).values()
    counties = sorted(counties, key=lambda k: k.name)
    st_ct = []

    for county in counties:
        st_ct.append([county, sorted(county.subcounties, key=lambda k: k.name)])
    return render_template('admcounties.html', counties=st_ct)

def get_church_details(sub_county, church):
    """Get subcounty and church details"""

    sub = None

    # Get all Subcounty objects from storage
    all_subcounties = storage.all(Subcounty).values()

    # Find the Subcounty object with the matching name
    for sub_obj in all_subcounties:
        if sub_obj.name == sub_county:
            sub = sub_obj
            break

    if sub is None:
        return None, None

    ch_list = sorted(sub.churches, key=lambda k: k.name)

    chur = None

    for ch in ch_list:
        if ch.name == church:
            chur = ch
            break
    
    return chur

@app.route("/admin", strict_slashes=False)
def admin():
    """Handles the administration route"""
    return render_template('admin.html')


@app.route("/subcounties", strict_slashes=False)
def sub_counties():
    """Displays a list of subcounties in Counties"""
    counties = storage.all(County).values()
    counties = sorted(counties, key=lambda k: k.name)
    st_ct = []

    for county in counties:
        st_ct.append([county, sorted(county.subcounties, key=lambda k: k.name)])

    return render_template('counties.html',
                           counties=st_ct)


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


@app.route("/<sub_county>/<church>", strict_slashes=False)
def church(sub_county, church):
    """Displays Financial options"""

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

    chur = None

    for ch in ch_list:
        if ch.name == church:
            chur = ch
            break
    return render_template('ch.html', subcounty=sub, church=chur)


@app.route("/<sub_county>/<church>/infinances", strict_slashes=True)
def ichurch(sub_county, church):
    """Displays Financial revenue into the church"""
    chur = get_church_details(sub_county, church)

    return render_template('infinances.html', church=chur)


@app.route("/<sub_county>/<church>/outfinances", strict_slashes=False)
def ochurch(sub_county, church):
    """Financial expenditure of the church"""
    chur = get_church_details(sub_county, church)

    return render_template('outfinances.html', church=chur)


@app.route("/<sub_county>/<church>/deptfinances", strict_slashes=True)
def deptchurch(sub_county, church):
    """Financial revenue from different departments of the church"""
    chur = get_church_details(sub_county, church)

    return render_template('deptfinances.html', church=chur)



if __name__ == "__main__":
    """Run if main"""
    app.run(host='0.0.0.0', port=5000)
