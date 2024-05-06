#!/usr/bin/python3
# church.py

"""Handles all default RestFul API actions for churches"""

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/subcounties/<subcounty_id>/churches', methods=['GET'],
                 strict_slashes=False)
def get_churches(subcounty_id):
    """
    Retrieves the list of all Church objects of a Subcounty
    """
    subcounty = storage.get(Subcounty, subcounty_id)

    if not subcounty:
        abort(404)

    churches = [church.to_dict() for church in subcounty.churches]

    return jsonify(churches)


@app_views.route('/churches/<church_id>', methods=['GET'], strict_slashes=False)
def get_church(church_id):
    """
    Retrieves a Church object
    """
    church = storage.get(Church, church_id)
    if not church:
        abort(404)

    return jsonify(church.to_dict())


@app_views.route('/churches/<church_id>', methods=['DELETE'],
                 strict_slashes=False)
def delete_church(church_id):
    """
    Deletes a Church Object
    """

    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    storage.delete(church)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/subcounties/<subcounty_id>/churches', methods=['POST'],
                 strict_slashes=False)
def post_church(subcounty_id):
    """
    Creates a Church
    """
    subcounty = storage.get(Subcounty, subcounty_id)

    if not subcounty:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    if 'user_id' not in request.get_json():
        abort(400, description="Missing user_id")

    data = request.get_json()

    if 'name' not in request.get_json():
        abort(400, description="Missing name")

    data["subcounty_id"] = subcounty_id
    instance = Church(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/churches/<church_id>', methods=['PUT'], strict_slashes=False)
def put_church(church_id):
    """
    Updates a Church
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    data = request.get_json()
    if not data:
        abort(400, description="Not a JSON")

    ignore = ['id', 'subcounty_id', 'updated_at']

    for key, value in data.items():
        if key not in ignore:
            setattr(church, key, value)
    storage.save()
    return make_response(jsonify(church.to_dict()), 200)


@app_views.route('/churches_search', methods=['POST'], strict_slashes=False)
def churches_search():
    """
    Retrieves all Church objects depending of the JSON in the body
    of the request
    """

    if request.get_json() is None:
        abort(400, description="Not a JSON")

    data = request.get_json()

    if data and len(data):
        counties = data.get('counties', None)
        subcounties = data.get('subcounties', None)

    if not data or not len(data) or (
            not counties and
            not subcounties):
        churches = storage.all(Church).values()
        list_churches = []
        for church in churches:
            list_churches.append(church.to_dict())
        return jsonify(list_churches)

    list_churches = []
    if counties:
        counties_obj = [storage.get(County, s_id) for s_id in counties]
        for county in counties_obj:
            if county:
                for subcounty in county.subcounties:
                    if subcounty:
                        for church in subcounty.churches:
                            list_churches.append(church)

    if subcounties:
        subcounty_obj = [storage.get(Subcounty, c_id) for c_id in subcounties]
        for subcounty in subcounty_obj:
            if subcounty:
                for church in subcounty.churches:
                    if church not in list_churches:
                        list_churches.append(church)

    churches = []
    for p in list_churches:
        d = p.to_dict()
        churches.append(d)

    return jsonify(churches)
