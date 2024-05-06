#!/usr/bin/python3
# outfinance.py

""" Handles all default ResrFul API actions for out finances"""

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.outfinance import Outfinance
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/churches/<church_id>/outfinances', methods=['GET'],
                 strict_slashes=False)
def get_outfinances(church_id):
    """
    Retrieves the list of all finances into the church
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    outfinances = [outfinance.to_dict() for outfinance in church.outfinances]

    return jsonify(outfinances)


@app_views.route('/outfinances/<outfinance_id>', methods=['GET'], strict_slashes=False)
def get_outfinance(outfinance_id):
    """
    Retrieves an Outfinance object
    """
    outfinance = storage.get(Outfinance, outfinance_id)
    if not outfinance:
        abort(404)

    return jsonify(outfinance.to_dict())


@app_views.route('/outfinances/<outfinance_id>', methods=['DELETE'],
                 strict_slashes=False)
def delete_outfinance(outfinance_id):
    """
    Deletes an Outfinance Object
    """

    outfinance = storage.get(Outfinance, outfinance_id)

    if not outfinance:
        abort(404)

    storage.delete(outfinance)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/churches/<church_id>/outfinances', methods=['POST'],
                 strict_slashes=False)
def post_outfinance(church_id):
    """
    Creates finance object into the church
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    data = request.get_json()

    if 'amount' not in request.get_json():
        abort(400, description="Missing amount")

    data['church_id'] = church_id
    instance = Outfinance(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/outfinances/<outfinance_id>', methods=['PUT'], strict_slashes=False)
def put_outfinance(outfinance_id):
    """
    Updates capital brought into the church
    """
    outfinance = storage.get(Outfinance, outfinance_id)

    if not outfinance:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'user_id', 'church_id', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(outfinance, key, value)
    storage.save()
    return make_response(jsonify(outfinance.to_dict()), 200)
