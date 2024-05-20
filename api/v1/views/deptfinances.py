#!/usr/bin/python3
# deptfinance.py

#!/usr/bin/python3
# deptfinance.py

""" Handles all default RestFul API actions for finances from departments"""

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.deptfinance import Deptfinance
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/churches/<church_id>/deptfinances', methods=['GET'],
                 strict_slashes=False)
def get_deptfinances(church_id):
    """
    Retrieves the list of all finances into the church by departments
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    deptfinances = [dep_finance.to_dict() for dep_finance in church.dep_finance]

    return jsonify(deptfinances)


@app_views.route('/deptfinances/<deptfinance_id>', methods=['GET'], strict_slashes=False)
def get_deptfinance(deptfinance_id):
    """
    Retrieves an Deptfinance object
    """
    deptfinance = storage.get(Deptfinance, deptfinance_id)
    if not deptfinance:
        abort(404)

    return jsonify(deptfinance.to_dict())


@app_views.route('/deptfinances/<deptfinance_id>', methods=['DELETE'],
                 strict_slashes=False)
def delete_deptfinance(deptfinance_id):
    """
    Deletes a Deptfinance Object
    """

    deptfinance = storage.get(Deptfinance, deptfinance_id)

    if not deptfinance:
        abort(404)

    storage.delete(deptfinance)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/churches/<church_id>/deptfinances', methods=['POST'],
                 strict_slashes=False)
def post_deptfinance(church_id):
    """
    Creates finance object into the church by departments
    """
    church = storage.get(Church, church_id)

    if not church:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    data = request.get_json()

    """PUT For a single object
    if 'amount' not in request.get_json():
        abort(400, description="Missing amount")

    data['church_id'] = church_id
    instance = Deptfinance(**data)
    instance.save()
    """
    """Check if the data is a list"""
    if isinstance(data, list):
        for item in data:
            if 'amount' not in item:
                abort(400, description="Missing amount in one of the objects")
            item['church_id'] = church_id
            instance = Deptfinance(**item)
            instance.save()
    else:
        if 'amount' not in data:
            abort(400, description="Missing amount")
        data['church_id'] = church_id
        instance = Deptfinance(**data)
        instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/deptfinances/<deptfinance_id>', methods=['PUT'], strict_slashes=False)
def put_deptfinance(deptfinance_id):
    """
    Updates capital brought into the church by departments
    """
    deptfinance = storage.get(Deptfinance, deptfinance_id)

    if not deptfinance:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'user_id', 'church_id', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(deptfinance, key, value)
    storage.save()
    return make_response(jsonify(deptfinance.to_dict()), 200)
