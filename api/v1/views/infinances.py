#!/usr/bin/python3
# infinance.py

""" Handles all default ResrFul API actions for infinances"""

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.infinance import Infinance
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/churches/<church_id>/infinances', methods=['GET'],
                 strict_slashes=False)
def get_infinances(church_id):
    """
    Retrieves the list of all finances into the church
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    infinances = [in_finance.to_dict() for in_finance in church.in_finance]

    return jsonify(infinances)


@app_views.route('/infinances/<infinance_id>', methods=['GET'], strict_slashes=False)
def get_infinance(infinance_id):
    """
    Retrieves an Infinance object
    """
    infinance = storage.get(Infinance, infinance_id)
    if not infinance:
        abort(404)

    return jsonify(infinance.to_dict())


@app_views.route('/infinances/<infinance_id>', methods=['DELETE'],
                 strict_slashes=False)
def delete_infinance(infinance_id):
    """
    Deletes an Infinance Object
    """

    infinance = storage.get(Infinance, infinance_id)

    if not infinance:
        abort(404)

    storage.delete(infinance)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/churches/<church_id>/infinances', methods=['POST'],
                 strict_slashes=False)
def post_infinance(church_id):
    """
    Creates finance object into the church
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    data = request.get_json()

    """For a single JSON Object
    if 'amount' not in request.get_json():
        abort(400, description="Missing amount")

    data['church_id'] = church_id
    instance = Infinance(**data)
    instance.save()"""
    
    # Check if the data is a list
    if isinstance(data, list):
        for item in data:
            if 'amount' not in item:
                abort(400, description="Missing amount in one of the objects")
            item['church_id'] = church_id
            instance = Infinance(**item)
            instance.save()
    else:
        if 'amount' not in data:
            abort(400, description="Missing amount")
        data['church_id'] = church_id
        instance = Infinance(**data)
        instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/infinances/<infinance_id>', methods=['PUT'], strict_slashes=False)
def put_infinance(infinance_id):
    """
    Updates capital brought into the church
    """
    infinance = storage.get(Infinance, infinance_id)

    if not infinance:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'user_id', 'church_id', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(infinance, key, value)
    storage.save()
    return make_response(jsonify(infinance.to_dict()), 200)
