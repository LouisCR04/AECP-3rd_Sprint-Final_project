#!/usr/bin/python3
# index.py

from models.county import County
from models.subcounty import Subcounty
from models.church import Church
from models.deptfinance import Deptfinance
from models.outfinance import Outfinance
from models.infinance import Infinance
from models import storage
from api.v1.views import app_views
from flask import jsonify


@app_views.route('/status', methods=['GET'], strict_slashes=False)
def status():
    """ Status of API """
    return jsonify({"status": "OK"})


@app_views.route('/stats', methods=['GET'], strict_slashes=False)
def number_objects():
    """ Retrieves the number of each objects by type """
    classes = [County, Subcounty, Church, Deptfinance, Outfinance, Infinance]
    names = ["counties", "subcounties", "churches", "deptfinance", "outfinance", "infinance"]

    objs = {}

    for i in range(len(classes)):
        objs[names[i]] = storage.count(classes[i])

    return jsonify(objs)
