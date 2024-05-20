#!/usr/bin/python3
# subcounty.py

#!/usr/bin/python3
""" objects that handles all default RestFul API actions for subcounties """

from models.county import County
from models.subcounty import Subcounty
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/counties/<county_id>/subcounties', methods=['GET'],
                 strict_slashes=False)
def get_subcounties(county_id):
    """
    Retrieves the list of all subcounty objects
    of a specific county, or a specific subcounty
    """
    list_subcounties = []
    county = storage.get(County, county_id)
    if not county:
        abort(404)
    for subcounty in county.subcounties:
        list_subcounties.append(subcounty.to_dict())

    return jsonify(list_subcounties)


@app_views.route('/subcounties/<subcounty_id>/', methods=['GET'], strict_slashes=False)
def get_subcounty(subcounty_id):
    """
    Retrieves a specific subcounty based on id
    """
    subcounty = storage.get(Subcounty, subcounty_id)
    if not subcounty:
        abort(404)
    return jsonify(subcounty.to_dict())


@app_views.route('/subcounties/<subcounty_id>', methods=['DELETE'], strict_slashes=False)
def delete_subcounty(subcounty_id):
    """
    Deletes a subcounty based on id provided
    """
    subcounty = storage.get(Subcounty, subcounty_id)

    if not subcounty:
        abort(404)
    storage.delete(subcounty)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/counties/<county_id>/subcounties', methods=['POST'],
                 strict_slashes=False)
def post_subcounty(county_id):
    """
    Creates a Subcounty
    """
    county = storage.get(County, county_id)
    if not county:
        abort(404)
    if not request.get_json():
        abort(400, description="Not a JSON")
    if 'name' not in request.get_json():
        abort(400, description="Missing name")

    data = request.get_json()
    instance = Subcounty(**data)
    instance.county_id = county.id
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/subcounties/<subcounty_id>', methods=['PUT'], strict_slashes=False)
def put_subcounty(subcounty_id):
    """
    Updates a Subcounty
    """
    subcounty = storage.get(Subcounty, subcounty_id)
    if not subcounty:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'county_id', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(subcounty, key, value)
    storage.save()
    return make_response(jsonify(subcounty.to_dict()), 200)
