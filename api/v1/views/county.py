#!/usr/bin/python3
# county.py

"""Handles all default RestFul API actions for States"""

from models.county import County
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request

@app_views.route('/counties', methods=['GET'], strict_slashes=False)
def get_counties():
    """Retrieves a list of all counties"""
    all_counties = storage.all(County).values()
    list_counties = []

    for county in all_counties:
        list_counties.append(county.to_dict())

    return jsonify(list_counties)


@app_views.route('/counties/<counties_id>', methods=['GET'],
                 strict_slashes=False)
def get_state(state_id):
    """Retrieves a specific county"""
    county = storage.get(State, county_id)
    if not county:
        abort(404)

    return jsonify(county.to_dict())


@app_views.route('/counties/<counties_id>', methods=['DELETE'],
                 strict_slashes=False)
def delete_county(county_id):
    """Deletes a county"""
    county = storage.get(County, county_id)

    if not state:
        abort(404)

    storage.delete(county)
    storage.save()

    return make_response(jsonify({}), 200)
